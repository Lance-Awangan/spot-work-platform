import { Router } from 'express';
import { requireAuth } from '../../common/middlewares/auth.middleware.js';
import { requireRole } from '../../common/middlewares/role.middleware.js';
import { AttendanceController } from './attendance.controller.js';

const router = Router();

router.post(
  '/check-in',
  requireAuth,
  requireRole('WORKER'),
  AttendanceController.checkIn,
);

router.post(
  '/check-out',
  requireAuth,
  requireRole('WORKER'),
  AttendanceController.checkOut,
);

export default router;