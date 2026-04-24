import type { Response } from 'express';
import type { AuthenticatedRequest } from '../../common/middlewares/auth.middleware.js';

export class AuthMeController {
  static me(req: AuthenticatedRequest, res: Response) {
    return res.status(200).json({
      message: 'Authenticated user',
      user: req.user,
    });
  }
}