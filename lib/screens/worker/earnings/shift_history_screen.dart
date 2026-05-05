import 'package:flutter/material.dart';
import '../../../widgets/common/app_widgets.dart';

class ShiftHistoryScreen extends StatelessWidget {
  const ShiftHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shifts = [
      {'role': 'Cashier', 'company': 'FreshMart QC', 'date': 'Apr 3, 2025', 'hours': '6 hrs', 'pay': '₱1,020'},
      {'role': 'Stock Clerk', 'company': 'MiniStop Cubao', 'date': 'Mar 30, 2025', 'hours': '8 hrs', 'pay': '₱918'},
      {'role': 'Barista', 'company': 'Brewed Coffee', 'date': 'Mar 27, 2025', 'hours': '8 hrs', 'pay': '₱960'},
      {'role': 'Kitchen Helper', 'company': 'Jollibee', 'date': 'Mar 20, 2025', 'hours': '4 hrs', 'pay': '₱640'},
      {'role': 'Security Guard', 'company': 'SM Malls', 'date': 'Mar 15, 2025', 'hours': '12 hrs', 'pay': '₱2,160'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Shift History')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: shifts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final s = shifts[i];
          return AppCard(child: Row(children: [
            Container(width: 44, height: 44, decoration: BoxDecoration(color: theme.colorScheme.surfaceVariant, borderRadius: BorderRadius.circular(10)), child: Icon(Icons.work_outline, color: theme.colorScheme.onSurfaceVariant)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s['role']!, style: theme.textTheme.titleSmall),
              Text(s['company']!, style: theme.textTheme.bodySmall),
              Text('${s['date']} · ${s['hours']}', style: theme.textTheme.bodySmall),
            ])),
            Text(s['pay']!, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          ]));
        },
      ),
    );
  }
}
