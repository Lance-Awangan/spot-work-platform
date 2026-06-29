import { prisma } from '../../common/prisma/client.js';

export class AttendanceService {
  static async checkIn(
    workerId: string,
    matchId: string,
    method: 'QR' | 'MANUAL',
  ) {
    return prisma.$transaction(async (tx) => {
      // Find match
      const match = await tx.match.findUnique({
        where: {
          id: matchId,
        },
        include: {
          attendance: true,
        },
      });

      if (!match) {
        return {
          status: 'error',
          message: 'Match not found',
        };
      }

      // Verify ownership
      if (match.workerId !== workerId) {
        return {
          status: 'error',
          message: 'Unauthorized',
        };
      }

      // Match must be accepted
      if (match.status !== 'ACCEPTED') {
        return {
          status: 'error',
          message: 'Match is not accepted',
        };
      }

      // Prevent duplicate check-in
      if (match.attendance?.checkInTime) {
        return {
          status: 'error',
          message: 'Already checked in',
        };
      }

      let attendance;

      // Attendance already exists
      if (match.attendance) {
        attendance = await tx.attendance.update({
          where: {
            matchId,
          },
          data: {
            checkInTime: new Date(),
            method,
          },
        });
      } else {
        attendance = await tx.attendance.create({
          data: {
            matchId,
            checkInTime: new Date(),
            method,
          },
        });
      }

      // Update work status
      await tx.match.update({
        where: {
          id: matchId,
        },
        data: {
          workStatus: 'IN_PROGRESS',
        },
      });

      return {
        status: 'success',
        attendance,
      };
    });
  }

    static async checkOut(
    workerId: string,
    matchId: string,
    method: 'QR' | 'MANUAL',
  ) {
    return prisma.$transaction(async (tx) => {
      const match = await tx.match.findUnique({
        where: {
          id: matchId,
        },
        include: {
          attendance: true,
        },
      });

      if (!match) {
        return {
          status: 'error',
          message: 'Match not found',
        };
      }

      if (match.workerId !== workerId) {
        return {
          status: 'error',
          message: 'Unauthorized',
        };
      }

      if (match.status !== 'ACCEPTED') {
        return {
          status: 'error',
          message: 'Match is not accepted',
        };
      }

      if (!match.attendance?.checkInTime) {
        return {
          status: 'error',
          message: 'Cannot check out without checking in',
        };
      }

      if (match.attendance.checkOutTime) {
        return {
          status: 'error',
          message: 'Already checked out',
        };
      }

      const attendance = await tx.attendance.update({
        where: {
          matchId,
        },
        data: {
          checkOutTime: new Date(),
          method,
          isCompleted: true,
        },
      });

      await tx.match.update({
        where: {
          id: matchId,
        },
        data: {
          workStatus: 'COMPLETED',
        },
      });

      return {
        status: 'success',
        attendance,
      };
    });
  }
}