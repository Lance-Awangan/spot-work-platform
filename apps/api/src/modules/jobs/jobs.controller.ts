import { Response } from 'express';
import { AuthenticatedRequest } from '../../common/middlewares/auth.middleware.js';
import { createJobSchema } from './jobs.schema.js';
import { JobsService } from './jobs.service.js';

export class JobsController {
  static async create(req: AuthenticatedRequest, res: Response) {
    const input = createJobSchema.parse(req.body);

    const job = await JobsService.createJob(
      input,
      req.user!.userId
    );

    res.status(201).json(job);
  }

  static async getAll(_req: AuthenticatedRequest, res: Response) {
    const jobs = await JobsService.getJobs();
    res.json(jobs);
  }

  static async getOne(req: AuthenticatedRequest, res: Response) {
  const id = req.params.id;

  if (typeof id !== 'string') {
    return res.status(400).json({ message: 'Job id is required' });
  }

  const job = await JobsService.getJobById(id);

  if (!job) {
    return res.status(404).json({ message: 'Job not found' });
  }

  return res.json(job);
}
}