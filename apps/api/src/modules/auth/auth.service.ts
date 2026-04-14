import { prisma } from '../../common/prisma/client.js';
import { comparePassword, hashPassword } from '../../common/utils/hash.js';
import { signAuthToken } from '../../common/utils/jwt.js';
import type { LoginInput, RegisterInput } from './auth.schema.js';

export class AuthService {
  static async register(input: RegisterInput) {
    const existingUser = await prisma.user.findFirst({
      where: {
        OR: [
          { email: input.email },
          ...(input.phone ? [{ phone: input.phone }] : []),
        ],
      },
    });

    if (existingUser) {
      throw new Error('Email or phone already in use');
    }

    const passwordHash = await hashPassword(input.password);

    const userData: any = {
      firstName: input.firstName,
      lastName: input.lastName,
      email: input.email,
      phone: input.phone,
      passwordHash,
      role: input.role,
    };

    if (input.role === 'WORKER') {
      userData.workerProfile = {
        create: {},
      };
    }

    if (input.role === 'BUSINESS') {
      userData.businessProfile = {
        create: {
          businessName: input.businessName || `${input.firstName}'s Business`,
        },
      };
    }

    const user = await prisma.user.create({
      data: userData,
    });

    const token = signAuthToken({
      userId: user.id,
      role: user.role,
    });

    return {
      user: {
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phone: user.phone,
        role: user.role,
      },
      token,
    };
  }

  static async login(input: LoginInput) {
    const user = await prisma.user.findUnique({
      where: { email: input.email },
    });

    if (!user) {
      throw new Error('Invalid email or password');
    }

    const isValidPassword = await comparePassword(
      input.password,
      user.passwordHash,
    );

    if (!isValidPassword) {
      throw new Error('Invalid email or password');
    }

    const token = signAuthToken({
      userId: user.id,
      role: user.role,
    });

    return {
      user: {
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phone: user.phone,
        role: user.role,
      },
      token,
    };
  }
}