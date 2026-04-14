import { Request, Response } from 'express';
import { ZodError } from 'zod';
import { AuthService } from './auth.service.js';
import { loginSchema, registerSchema } from './auth.schema.js';

export class AuthController {
  static async register(req: Request, res: Response) {
    try {
      const input = registerSchema.parse(req.body);
      const result = await AuthService.register(input);

      return res.status(201).json(result);
    } catch (error) {
      if (error instanceof ZodError) {
        return res.status(400).json({
          message: 'Validation failed',
          errors: error.issues,
        });
      }

      return res.status(400).json({
        message: error instanceof Error ? error.message : 'Registration failed',
      });
    }
  }

  static async login(req: Request, res: Response) {
    try {
      const input = loginSchema.parse(req.body);
      const result = await AuthService.login(input);

      return res.status(200).json(result);
    } catch (error) {
      if (error instanceof ZodError) {
        return res.status(400).json({
          message: 'Validation failed',
          errors: error.issues,
        });
      }

      return res.status(400).json({
        message: error instanceof Error ? error.message : 'Login failed',
      });
    }
  }
}