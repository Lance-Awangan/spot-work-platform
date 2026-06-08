import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Job Listing Screen'),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.go('/job-detail');
              },
              child: const Text('Go to Job details'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Go back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}