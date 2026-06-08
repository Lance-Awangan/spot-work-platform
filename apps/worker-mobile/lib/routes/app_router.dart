import 'package:go_router/go_router.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/jobs/presentation/job_listing_screen.dart';
import '../features/jobs/presentation/job_detail_screen.dart';
import '../features/applications/presentation/application_status_screen.dart';
import '../features/profile/presentation/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/jobs',
      builder: (context, state) => const JobListingScreen(),
    ),
    GoRoute(
      path: '/job-detail',
      builder: (context, state) => const JobDetailScreen(),
    ),
    GoRoute(
      path: '/applications',
      builder: (context, state) => const ApplicationStatusScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);