import cors from 'cors';
import dotenv from 'dotenv';
import express from 'express';

import apiRouter from './routes';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', (_req, res) => {
  res.json({
    message: 'Spot Work API is running',
  });
});

app.use('/api', apiRouter);

export default app;