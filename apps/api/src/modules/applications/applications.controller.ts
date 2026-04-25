import { Response } from 'express';
import { ZodError } from 'zod';
import { AuthenticatedRequest } from '../../common/middlewares/auth.middleware.js';
import { applySchema } from './applications.schema.js';
import { ApplicationsService } from './applications.service.js';

export class ApplicationsController {
  static async apply(req: AuthenticatedRequest, res: Response) {
    try {
      const input = applySchema.parse(req.body);

      const result = await ApplicationsService.applyToJob(
        req.user!.userId,
        input.jobId,
      );

      if (result.status === 'rejected') {
        return res.status(400).json(result);
      }

      return res.status(201).json(result);
    } catch (error) {
      if (error instanceof ZodError) {
        return res.status(400).json({
          message: 'Validation failed',
          errors: error.issues,
        });
      }

      return res.status(500).json({
        message: 'Failed to apply to job',
      });
    }
  }
}