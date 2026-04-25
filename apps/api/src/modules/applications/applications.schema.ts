import { z } from 'zod';

export const applySchema = z.object({
  jobId: z.string().uuid(),
});

export type ApplyInput = z.infer<typeof applySchema>;