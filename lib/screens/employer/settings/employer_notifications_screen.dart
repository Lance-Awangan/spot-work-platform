import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class EmployerNotificationsScreen extends StatefulWidget {
  const EmployerNotificationsScreen({super.key});
  @override
  State<EmployerNotificationsScreen> createState() => _State();
}
class _State extends State<EmployerNotificationsScreen> {
  final _sections = {
    'Shift Matching': {'Worker matched': true, 'Worker confirmed': true, 'No match found': false},
    'Active Shifts': {'Worker clocked in': true, 'Worker clocked out': true, 'Worker running late': true, 'Shift cancelled': true},
    'Payments & Billing': {'Payment processed': true, 'Invoice ready': false, 'Low credit balance': true},
    'Account': {'Verification updates': true, 'Platform updates': false},
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _sections.entries.map((section) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(0, 16, 0, 8), child: Text(section.key.toUpperCase(), style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 0.8))),
            Container(
              decoration: BoxDecoration(color: theme.colorScheme.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: theme.colorScheme.outline)),
              child: Column(children: section.value.entries.map((e) => SwitchListTile(
                title: Text(e.key, style: theme.textTheme.bodyMedium),
                value: e.value,
                activeColor: AppColors.primary,
                onChanged: (v) => setState(() => _sections[section.key]![e.key] = v),
              )).toList()),
            ),
          ],
        )).toList(),
      ),
    );
  }
}
