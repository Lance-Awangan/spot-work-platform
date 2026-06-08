import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Profile Screen'),

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