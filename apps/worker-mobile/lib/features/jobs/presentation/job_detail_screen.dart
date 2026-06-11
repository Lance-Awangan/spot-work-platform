import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Service Crew',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Jollibee Cubao',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const _DetailRow(label: 'Pay', value: '₱320'),
            const _DetailRow(label: 'Schedule', value: 'Jun 15 • 8:00 AM - 12:00 PM'),
            const _DetailRow(label: 'Location', value: 'Cubao, Quezon City'),

            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Assist customers, support store operations, and help maintain cleanliness during the assigned shift.',
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                context.go('/applications');
              },
              child: const Text('Apply Now'),
            ),
            TextButton(
              onPressed: () {
                context.go('/jobs');
              },
              child: const Text('Back to Jobs'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}