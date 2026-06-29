import { z } from 'zod';

export const attendanceActionSchema = z.object({
  matchId: z.string().uuid(),
  method: z.enum(['QR', 'MANUAL']),
});

export type AttendanceActionInput = z.infer<typeof attendanceActionSchema>;