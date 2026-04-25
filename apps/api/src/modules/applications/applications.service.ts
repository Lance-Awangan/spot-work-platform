import { prisma } from '../../common/prisma/client.js';

export class ApplicationsService {
  static async applyToJob(workerId: string, jobId: string) {
    return prisma.$transaction(async (tx) => {
      const existingMatch = await tx.match.findUnique({
        where: {
          workerId_jobId: {
            workerId,
            jobId,
          },
        },
      });

      if (existingMatch) {
        return {
          status: 'rejected',
          reason: 'Worker already applied to this job',
        };
      }

      const job = await tx.job.findUnique({
        where: { id: jobId },
      });

      if (!job) {
        return {
          status: 'rejected',
          reason: 'Job not found',
        };
      }

      if (job.status !== 'OPEN') {
        return {
          status: 'rejected',
          reason: 'Job is not open',
        };
      }

      if (job.slotsFilled >= job.totalSlots) {
        return {
          status: 'rejected',
          reason: 'Job is full',
        };
      }

      const workerProfile = await tx.workerProfile.findUnique({
        where: { userId: workerId },
      });

      if (!workerProfile) {
        return {
          status: 'rejected',
          reason: 'Worker Profile not found',
        };
      }

      const requirements = job.requirements as
        | { skills?: string[] }
        | null; 

      const requiredSkills = requirements?.skills ?? [];

      const workerSkills = 
        workerProfile.skills
          ?.split(',')
          .map((skill) => skill.trim().toLowerCase())
          .filter(Boolean) ?? [];

      const missingSkills = requiredSkills.filter((skill: string) => {
        return !workerSkills.includes(skill.toLowerCase());
      }
      );

      if (missingSkills.length > 0) {
        return {
          status: 'rejected',
          reason: `Missing required skills: ${missingSkills.join(', ')}`,
        };
      }

      const updatedJob = await tx.job.updateMany({
        where: {
          id: jobId,
          status: 'OPEN',
          slotsFilled: {
            lt: job.totalSlots,
          },
        },
        data: {
          slotsFilled: {
            increment: 1,
          },
        },
      });

      if (updatedJob.count === 0) {
        return {
          status: 'rejected',
          reason: 'Job is full',
        };
      }

      const match = await tx.match.create({
        data: {
          workerId,
          jobId,
          status: 'ACCEPTED',
          workStatus: 'PENDING',
        },
      });

      return {
        status: 'accepted',
        match,
      };
    });
  }
}