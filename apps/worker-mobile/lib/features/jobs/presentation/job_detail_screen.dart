import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Job Detail Screen'),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.go('/jobs');
              },
              child: const Text('Go back to Job Listing'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.go('/profile');
              },
              child: const Text('Go to profile'),
            ),
          ],
        ),
      ),
    );
  }
}