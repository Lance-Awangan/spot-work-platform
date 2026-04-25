import { prisma } from '../../common/prisma/client.js';

export class ShiftsService {
  static async getMyShifts(workerId: string) {
    return prisma.match.findMany({
      where: {
        workerId,
        status: 'ACCEPTED',
      },
      include: {
        job: true,
        attendance: true,
        payment: true,
        fee: true,
      },
      orderBy: {
        createdAt: 'desc',
      },
    });
  }

  static async getBusinessShifts(businessId: string) {
    return prisma.job.findMany({
      where: {
        businessId,
      },
      include: {
        matches: {
          include: {
            worker: {
              select: {
                id: true,
                firstName: true,
                lastName: true,
                email: true,
                phone: true,
              },
            },
            attendance: true,
            payment: true,
            fee: true,
          },
        },
      },
      orderBy: {
        createdAt: 'desc',
      },
    });
  }

  static async getShiftByMatchId(matchId: string, userId: string, role: string) {
    const match = await prisma.match.findUnique({
      where: {
        id: matchId,
      },
      include: {
        job: true,
        attendance: true,
        payment: true,
        fee: true,
        worker: {
          select: {
            id: true,
            firstName: true,
            lastName: true,
            email: true,
            phone: true,
          },
        },
      },
    });

    if (!match) {
      return null;
    }

    const isWorkerOwner = role === 'WORKER' && match.workerId === userId;
    const isBusinessOwner = role === 'BUSINESS' && match.job.businessId === userId;

    if (!isWorkerOwner && !isBusinessOwner) {
      return 'unauthorized';
    }

    return match;
  }
}