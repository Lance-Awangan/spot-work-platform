import { Router } from 'express';
import { requireAuth } from '../../common/middlewares/auth.middleware.js';
import { requireRole } from '../../common/middlewares/role.middleware.js';
import { PaymentsController } from './payments.controller.js';

const router = Router();

router.post(
  '/update',
  requireAuth,
  requireRole('BUSINESS'),
  PaymentsController.updatePaymentStatus,
);

router.get(
  '/me',
  requireAuth,
  requireRole('WORKER'),
  PaymentsController.getMyPayments,
);

export default router;