import express from 'express';
import authRouter from './modules/auth/auth.routes.js';
import jobsRouter from './modules/jobs/jobs.routes.js';
import applicationsRouter from './modules/applications/applications.routes.js';
import shiftsRoutes from './modules/shifts/shifts.routes.js';
import attendanceRoutes from './modules/attendance/attendance.routes.js';
import paymentsRoutes from './modules/payments/payments.routes.js';


const app = express();

app.use(express.json());

app.get('/api/health', (_req, res) => {
  res.json({ ok: true });
});

app.use('/api/auth', authRouter);
app.use('/api/jobs', jobsRouter);
app.use('/api/applications', applicationsRouter);
app.use('/api/shifts', shiftsRoutes);
app.use('/api/attendance', attendanceRoutes);
app.use('/api/payments', paymentsRoutes);

export default app;