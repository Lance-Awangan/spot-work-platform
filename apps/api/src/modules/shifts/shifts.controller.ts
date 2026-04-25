import { Response } from 'express';
import { AuthenticatedRequest } from '../../common/middlewares/auth.middleware.js';
import { ShiftsService } from './shifts.service.js';

export class ShiftsController {
  static async getMyShifts(req: AuthenticatedRequest, res: Response) {
    try {
      const shifts = await ShiftsService.getMyShifts(req.user!.userId);

      return res.status(200).json({
        message: 'Worker shifts retrieved successfully',
        data: shifts,
      });
    } catch {
      return res.status(500).json({
        message: 'Failed to retrieve worker shifts',
      });
    }
  }

  static async getBusinessShifts(req: AuthenticatedRequest, res: Response) {
    try {
      const shifts = await ShiftsService.getBusinessShifts(req.user!.userId);

      return res.status(200).json({
        message: 'Business shifts retrieved successfully',
        data: shifts,
      });
    } catch {
      return res.status(500).json({
        message: 'Failed to retrieve business shifts',
      });
    }
  }

  static async getShiftByMatchId(req: AuthenticatedRequest, res: Response) {
  try {
    const matchId = req.params.matchId as string;

    if (!matchId) {
      return res.status(400).json({
        message: 'Match ID is required',
      });
    }

    const shift = await ShiftsService.getShiftByMatchId(
      matchId,
      req.user!.userId,
      req.user!.role,
    );

    if (!shift) {
      return res.status(404).json({
        message: 'Shift not found',
      });
    }

    if (shift === 'unauthorized') {
      return res.status(403).json({
        message: 'You are not allowed to view this shift',
      });
    }

    return res.status(200).json({
      message: 'Shift retrieved successfully',
      data: shift,
    });

  } catch {
    return res.status(500).json({
      message: 'Failed to retrieve shift',
    });
  }
}
}