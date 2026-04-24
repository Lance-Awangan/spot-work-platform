import express from 'express';
import authRouter from './modules/auth/auth.routes.js';


const app = express();

app.use(express.json());

app.get('/api/health', (_req, res) => {
  res.json({ ok: true });
});

app.use('/api/auth', authRouter);

export default app;