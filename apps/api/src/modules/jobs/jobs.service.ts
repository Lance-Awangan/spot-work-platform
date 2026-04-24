import type { Prisma } from '@prisma/client';
import { prisma } from '../../common/prisma/client.js';

export type CreateJobInput = {
  title: string;
  description?: string | undefined;
  location: string;
  date: string;
  startTime: string;
  endTime: string;
  payAmount: number;
  totalSlots: number;
  requirements?: Prisma.InputJsonValue | undefined;
};

export class JobsService {
  static async createJob(data: CreateJobInput, businessId: string) {
    return prisma.job.create({
      data: {
            businessId,
            title: data.title,
            location: data.location,
            date: new Date(data.date),
            startTime: new Date(data.startTime),
            endTime: new Date(data.endTime),
            payAmount: data.payAmount,
            totalSlots: data.totalSlots,

            ...(data.description !== undefined && {
                description: data.description,
            }),

            ...(data.requirements !== undefined && {
                requirements: data.requirements,
            }),
        },
    });
  }

  static async getJobs() {
    return prisma.job.findMany({
      where: { status: 'OPEN' },
    });
  }

  static async getJobById(id: string) {
    return prisma.job.findUnique({
      where: { id },
    });
  }
}