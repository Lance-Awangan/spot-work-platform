import { z } from 'zod';

export const createJobSchema = z.object({
  title: z.string().min(1),
  description: z.string().optional(),
  location: z.string().min(1),
  date: z.string(),
  startTime: z.string(),
  endTime: z.string(),
  payAmount: z.number().positive(),
  totalSlots: z.number().int().positive(),
  requirements: z.any().optional(),
});