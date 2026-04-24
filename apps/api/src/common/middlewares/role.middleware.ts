import type { NextFunction, Response } from 'express';
import type { AuthenticatedRequest } from './auth.middleware.js';

export function requireRole(role: 'WORKER' | 'BUSINESS') {
  return (
    req: AuthenticatedRequest,
    res: Response,
    next: NextFunction,
  ) => {
    if (!req.user) {
      return res.status(401).json({
        message: 'Unauthorized',
      });
    }

    if (req.user.role !== role) {
      return res.status(403).json({
        message: 'Forbidden: insufficient permissions',
      });
    }

    return next();
  };
}