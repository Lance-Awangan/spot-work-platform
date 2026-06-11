import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<Map<String, String>> workHistory = const [
    {
      'title': 'Service Crew',
      'business': 'Jollibee Cubao',
      'date': 'Jun 10',
      'pay': '₱320',
      'status': 'Completed',
    },
    {
      'title': 'Cashier',
      'business': 'McDonald\'s Makati',
      'date': 'Jun 8',
      'pay': '₱350',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 12),
            const Text(
              'Juan Dela Cruz',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text('juan.delacruz@email.com'),
            const SizedBox(height: 24),

            Row(
              children: const [
                Expanded(
                  child: _StatCard(label: 'Completed', value: '2'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _StatCard(label: 'Rating', value: '4.8'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Work History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.separated(
                itemCount: workHistory.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = workHistory[index];

                  return Card(
                    child: ListTile(
                      title: Text(
                        item['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${item['business']}\n${item['date']} • ${item['status']}',
                      ),
                      trailing: Text(
                        item['pay']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

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

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }
}