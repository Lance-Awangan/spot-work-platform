import { z } from 'zod';

export const updatePaymentSchema = z.object({
  matchId: z.string().uuid(),
  paymentStatus: z.enum(['PENDING', 'PAID']),
});

export type UpdatePaymentInput = z.infer<typeof updatePaymentSchema>;