import 'dotenv/config';
import app from './app.js';

const port = Number(process.env.PORT) || 4000;

console.log('DATABASE_URL loaded:', Boolean(process.env.DATABASE_URL));

app.listen(port, () => {
  console.log(`API server running on http://localhost:${port}`);
});