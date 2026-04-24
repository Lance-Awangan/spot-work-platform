import type { NextFunction, Request, Response } from 'express';
import { verifyAuthToken } from '../utils/jwt.js';

export type AuthenticatedRequest = Request & {
  user?: {
    userId: string;
    role: 'WORKER' | 'BUSINESS';
  };
};

export function requireAuth(
  req: AuthenticatedRequest,
  res: Response,
  next: NextFunction,
) {
  try {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({
        message: 'Missing or invalid authorization token',
      });
    }

    const token = authHeader.split(' ')[1];

    // 🔥 ADD THIS CHECK
    if (!token) {
      return res.status(401).json({
        message: 'Invalid token format',
      });
    }

    const payload = verifyAuthToken(token);

    req.user = payload;

    return next();
  } catch {
    return res.status(401).json({
      message: 'Invalid or expired token',
    });
  }
}