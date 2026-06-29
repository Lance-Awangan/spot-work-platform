import { Response } from 'express';
import { ZodError } from 'zod';
import { AuthenticatedRequest } from '../../common/middlewares/auth.middleware.js';
import { updatePaymentSchema } from './payments.schema.js';
import { PaymentsService } from './payments.service.js';

export class PaymentsController {
  static async updatePaymentStatus(req: AuthenticatedRequest, res: Response) {
    try {
      const input = updatePaymentSchema.parse(req.body);

      const result = await PaymentsService.updatePaymentStatus(
        req.user!.userId,
        input.matchId,
        input.paymentStatus,
      );

      if (result.status === 'error') {
        return res.status(400).json(result);
      }

      return res.status(200).json(result);
    } catch (error) {
      if (error instanceof ZodError) {
        return res.status(400).json({
          message: 'Validation failed',
          errors: error.issues,
        });
      }

      return res.status(500).json({
        message: 'Internal server error',
      });
    }
  }

  static async getMyPayments(req: AuthenticatedRequest, res: Response) {
    try {
      const payments = await PaymentsService.getMyPayments(req.user!.userId);

      return res.status(200).json({
        message: 'Payments retrieved successfully',
        data: payments,
      });
    } catch {
      return res.status(500).json({
        message: 'Internal server error',
      });
    }
  }
}