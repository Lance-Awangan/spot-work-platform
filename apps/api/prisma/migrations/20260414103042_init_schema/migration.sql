/*
  Warnings:

  - The values [CANCELLED] on the enum `JobStatus` will be removed. If these variants are still used in the database, this will fail.
  - The values [ADMIN] on the enum `UserRole` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `payRate` on the `Job` table. All the data in the column will be lost.
  - You are about to drop the column `payType` on the `Job` table. All the data in the column will be lost.
  - You are about to drop the column `slots` on the `Job` table. All the data in the column will be lost.
  - You are about to drop the `Application` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Shift` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[phone]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `date` to the `Job` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payAmount` to the `Job` table without a default value. This is not possible if the table is not empty.
  - Added the required column `totalSlots` to the `Job` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "MatchStatus" AS ENUM ('ACCEPTED', 'REJECTED');

-- CreateEnum
CREATE TYPE "WorkStatus" AS ENUM ('PENDING', 'IN_PROGRESS', 'COMPLETED');

-- CreateEnum
CREATE TYPE "AttendanceMethod" AS ENUM ('QR', 'MANUAL');

-- CreateEnum
CREATE TYPE "PaymentStatus" AS ENUM ('PENDING', 'PAID');

-- CreateEnum
CREATE TYPE "FeeStatus" AS ENUM ('PENDING', 'PAID');

-- AlterEnum
BEGIN;
CREATE TYPE "JobStatus_new" AS ENUM ('OPEN', 'CLOSED');
ALTER TABLE "public"."Job" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "Job" ALTER COLUMN "status" TYPE "JobStatus_new" USING ("status"::text::"JobStatus_new");
ALTER TYPE "JobStatus" RENAME TO "JobStatus_old";
ALTER TYPE "JobStatus_new" RENAME TO "JobStatus";
DROP TYPE "public"."JobStatus_old";
ALTER TABLE "Job" ALTER COLUMN "status" SET DEFAULT 'OPEN';
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "UserRole_new" AS ENUM ('WORKER', 'BUSINESS');
ALTER TABLE "User" ALTER COLUMN "role" TYPE "UserRole_new" USING ("role"::text::"UserRole_new");
ALTER TYPE "UserRole" RENAME TO "UserRole_old";
ALTER TYPE "UserRole_new" RENAME TO "UserRole";
DROP TYPE "public"."UserRole_old";
COMMIT;

-- DropForeignKey
ALTER TABLE "Application" DROP CONSTRAINT "Application_jobId_fkey";

-- DropForeignKey
ALTER TABLE "Application" DROP CONSTRAINT "Application_workerId_fkey";

-- DropForeignKey
ALTER TABLE "Shift" DROP CONSTRAINT "Shift_applicationId_fkey";

-- DropForeignKey
ALTER TABLE "Shift" DROP CONSTRAINT "Shift_businessId_fkey";

-- DropForeignKey
ALTER TABLE "Shift" DROP CONSTRAINT "Shift_jobId_fkey";

-- DropForeignKey
ALTER TABLE "Shift" DROP CONSTRAINT "Shift_workerId_fkey";

-- AlterTable
ALTER TABLE "Job" DROP COLUMN "payRate",
DROP COLUMN "payType",
DROP COLUMN "slots",
ADD COLUMN     "date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "minRating" DOUBLE PRECISION,
ADD COLUMN     "payAmount" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "requirements" JSONB,
ADD COLUMN     "restrictions" JSONB,
ADD COLUMN     "slotsFilled" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "totalSlots" INTEGER NOT NULL,
ALTER COLUMN "description" DROP NOT NULL;

-- DropTable
DROP TABLE "Application";

-- DropTable
DROP TABLE "Shift";

-- DropEnum
DROP TYPE "ApplicationStatus";

-- DropEnum
DROP TYPE "ShiftStatus";

-- CreateTable
CREATE TABLE "Match" (
    "id" TEXT NOT NULL,
    "workerId" TEXT NOT NULL,
    "jobId" TEXT NOT NULL,
    "status" "MatchStatus" NOT NULL,
    "workStatus" "WorkStatus" NOT NULL DEFAULT 'PENDING',
    "agreementTimestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Match_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attendance" (
    "id" TEXT NOT NULL,
    "matchId" TEXT NOT NULL,
    "checkInTime" TIMESTAMP(3),
    "checkOutTime" TIMESTAMP(3),
    "method" "AttendanceMethod" NOT NULL,
    "isCompleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Attendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment" (
    "id" TEXT NOT NULL,
    "matchId" TEXT NOT NULL,
    "paymentStatus" "PaymentStatus" NOT NULL DEFAULT 'PENDING',
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fee" (
    "id" TEXT NOT NULL,
    "matchId" TEXT NOT NULL,
    "feeAmount" DOUBLE PRECISION NOT NULL,
    "feeStatus" "FeeStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Fee_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Match_workerId_jobId_key" ON "Match"("workerId", "jobId");

-- CreateIndex
CREATE UNIQUE INDEX "Attendance_matchId_key" ON "Attendance"("matchId");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_matchId_key" ON "Payment"("matchId");

-- CreateIndex
CREATE UNIQUE INDEX "Fee_matchId_key" ON "Fee"("matchId");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_workerId_fkey" FOREIGN KEY ("workerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attendance" ADD CONSTRAINT "Attendance_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fee" ADD CONSTRAINT "Fee_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match"("id") ON DELETE CASCADE ON UPDATE CASCADE;
