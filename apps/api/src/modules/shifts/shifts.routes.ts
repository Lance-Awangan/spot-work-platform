import { Router } from 'express';
import { requireAuth } from '../../common/middlewares/auth.middleware.js';
import { requireRole } from '../../common/middlewares/role.middleware.js';
import { ShiftsController } from './shifts.controller.js';

const router = Router();

/**
 * WORKER: Get my shifts (accepted matches)
 */
router.get(
  '/me',
  requireAuth,
  requireRole('WORKER'),
  ShiftsController.getMyShifts,
);

/**
 * BUSINESS: Get all shifts for jobs they posted
 */
router.get(
  '/business',
  requireAuth,
  requireRole('BUSINESS'),
  ShiftsController.getBusinessShifts,
);

/**
 * BOTH: Get single shift by matchId
 */
router.get(
  '/:matchId',
  requireAuth,
  ShiftsController.getShiftByMatchId,
);

export default router;