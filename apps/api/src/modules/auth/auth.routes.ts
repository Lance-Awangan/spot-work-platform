import { Router } from 'express';
import { AuthController } from './auth.controller.js';
import { requireAuth } from '../../common/middlewares/auth.middleware.js';
import { AuthMeController } from './auth.me.controller.js';

const authRouter = Router();

authRouter.post('/register', AuthController.register);
authRouter.post('/login', AuthController.login);
authRouter.get('/me', requireAuth, AuthMeController.me);

export default authRouter;