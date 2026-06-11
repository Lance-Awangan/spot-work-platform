import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApplicationStatusScreen extends StatelessWidget {
  const ApplicationStatusScreen({super.key});

  final List<Map<String, String>> applications = const [
    {
      'title': 'Service Crew',
      'business': 'Jollibee Cubao',
      'status': 'Pending',
      'date': 'Applied Jun 10',
    },
    {
      'title': 'Cashier',
      'business': 'McDonald\'s Makati',
      'status': 'Accepted',
      'date': 'Applied Jun 8',
    },
    {
      'title': 'Kitchen Helper',
      'business': 'Chowking Manila',
      'status': 'Rejected',
      'date': 'Applied Jun 5',
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Accepted':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text('My Applications'),
  ),
  body: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: applications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final application = applications[index];

              return Card(
                child: ListTile(
                  title: Text(
                    application['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${application['business']}\n${application['date']}',
                    ),
                  ),
                  trailing: Chip(
                    label: Text(application['status']!),
                    backgroundColor: getStatusColor(
                      application['status']!,
                    ).withOpacity(0.15),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              context.go('/profile');
            },
            child: const Text('View Profile'),
          ),
        ),

        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.go('/jobs');
            },
            child: const Text('Back to Jobs'),
          ),
        ),
      ],
    ),
  ),
  );
  }
}