import { Router } from 'express';
import { JobsController } from './jobs.controller.js';
import { requireAuth } from '../../common/middlewares/auth.middleware.js';
import { requireRole } from '../../common/middlewares/role.middleware.js';

const router = Router();

router.get('/', JobsController.getAll);
router.get('/:id', JobsController.getOne);

router.post(
  '/',
  requireAuth,
  requireRole('BUSINESS'),
  JobsController.create
);

export default router;