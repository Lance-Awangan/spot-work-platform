import { z } from 'zod';

export const registerSchema = z.object({
  firstName: z.string().min(1, 'First name is required'),
  lastName: z.string().min(1, 'Last name is required'),
  email: z.email(),
  phone: z.string().min(7).optional(),
  password: z.string().min(8, 'Password must be at least 8 characters'),
  role: z.enum(['WORKER', 'BUSINESS']),
  businessName: z.string().min(1).optional(),
});

export const loginSchema = z.object({
  email: z.email(),
  password: z.string().min(1, 'Password is required'),
});

export type RegisterInput = z.infer<typeof registerSchema>;
export type LoginInput = z.infer<typeof loginSchema>;