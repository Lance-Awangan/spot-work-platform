import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  final List<Map<String, String>> jobs = const [
    {
      'title': 'Service Crew',
      'business': 'Jollibee Cubao',
      'pay': '₱320',
      'schedule': 'Jun 15 • 8:00 AM - 12:00 PM',
      'location': 'Cubao, Quezon City',
    },
    {
      'title': 'Cashier',
      'business': 'McDonald’s Makati',
      'pay': '₱350',
      'schedule': 'Jun 16 • 9:00 AM - 1:00 PM',
      'location': 'Makati City',
    },
    {
      'title': 'Kitchen Helper',
      'business': 'Chowking Manila',
      'pay': '₱300',
      'schedule': 'Jun 17 • 12:00 PM - 4:00 PM',
      'location': 'Manila City',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Jobs'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: jobs.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final job = jobs[index];

          return Card(
            child: ListTile(
              title: Text(
                job['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '${job['business']}\n${job['schedule']}\n${job['location']}',
                ),
              ),
              trailing: Text(
                job['pay']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.go('/job-detail');
              },
            ),
          );
        },
      ),
    );
  }
}