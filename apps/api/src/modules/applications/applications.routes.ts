import { Router } from 'express';
import { requireAuth } from '../../common/middlewares/auth.middleware.js';
import { requireRole } from '../../common/middlewares/role.middleware.js';
import { ApplicationsController } from './applications.controller.js';

const router = Router();

router.post(
  '/',
  requireAuth,
  requireRole('WORKER'),
  ApplicationsController.apply,
);

export default router;