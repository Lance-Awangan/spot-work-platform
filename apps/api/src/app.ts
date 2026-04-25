import express from 'express';
import authRouter from './modules/auth/auth.routes.js';
import jobsRouter from './modules/jobs/jobs.routes.js';
import applicationsRouter from './modules/applications/applications.routes.js';


const app = express();

app.use(express.json());

app.get('/api/health', (_req, res) => {
  res.json({ ok: true });
});

app.use('/api/auth', authRouter);
app.use('/api/jobs', jobsRouter);
app.use('/api/apply', applicationsRouter);

export default app;