import { prisma } from '../../common/prisma/client.js';

export class PaymentsService {
  static async updatePaymentStatus(
    businessId: string,
    matchId: string,
    paymentStatus: 'PENDING' | 'PAID',
  ) {
    const match = await prisma.match.findUnique({
      where: { id: matchId },
      include: { job: true },
    });

    if (!match) {
      return {
        status: 'error',
        message: 'Match not found',
      };
    }

    if (match.job.businessId !== businessId) {
      return {
        status: 'error',
        message: 'Unauthorized',
      };
    }

    if (match.workStatus !== 'COMPLETED') {
      return {
        status: 'error',
        message: 'Match is not completed',
      };
    }

    const payment = await prisma.payment.upsert({
      where: { matchId },
      update: {
        paymentStatus,
      },
      create: {
        matchId,
        paymentStatus,
      },
    });

    return {
      status: 'success',
      payment,
    };
  }

  static async getMyPayments(workerId: string) {
    return prisma.payment.findMany({
      where: {
        match: {
          workerId,
        },
      },
      include: {
        match: {
          include: {
            job: true,
          },
        },
      },
      orderBy: {
        updatedAt: 'desc',
      },
    });
  }
}