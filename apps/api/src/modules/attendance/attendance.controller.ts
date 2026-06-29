import { Response } from 'express';
import { ZodError } from 'zod';
import { AuthenticatedRequest } from '../../common/middlewares/auth.middleware.js';
import { attendanceActionSchema } from './attendance.schema.js';
import { AttendanceService } from './attendance.service.js';

export class AttendanceController {
  static async checkIn(req: AuthenticatedRequest, res: Response) {
    try {
      const input = attendanceActionSchema.parse(req.body);

      const result = await AttendanceService.checkIn(
        req.user!.userId,
        input.matchId,
        input.method,
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

  static async checkOut(req: AuthenticatedRequest, res: Response) {
    try {
      const input = attendanceActionSchema.parse(req.body);

      const result = await AttendanceService.checkOut(
        req.user!.userId,
        input.matchId,
        input.method,
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
}