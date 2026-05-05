import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class ShiftDetailScreen extends StatelessWidget {
  const ShiftDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Shift Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(width: 56, height: 56, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.12), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.work_outline, color: AppColors.primary, size: 28)),
              const SizedBox(width: 14),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Cashier', style: theme.textTheme.headlineSmall),
                Text('FreshMart QC', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.primary)),
              ]),
            ]),
            const SizedBox(height: 24),
            AppCard(child: Column(children: const [
              DetailRow(label: 'Date', value: 'Today, April 3'),
              DetailRow(label: 'Time', value: '2:00 PM – 8:00 PM'),
              DetailRow(label: 'Duration', value: '6 hours'),
              DetailRow(label: 'Location', value: 'SM North EDSA, QC'),
              DetailRow(label: 'Distance', value: '0.8 km away'),
              DetailRow(label: 'Rate', value: '₱170 / hour'),
              DetailRow(label: 'Total Pay', value: '₱1,020', showDivider: false),
            ])),
            const SizedBox(height: 20),
            SectionHeader(title: 'Requirements'),
            Wrap(spacing: 8, runSpacing: 8, children: ['Cashier experience', 'POS system', 'Customer service'].map((s) => Chip(label: Text(s))).toList()),
            const SizedBox(height: 20),
            SectionHeader(title: 'About the Employer'),
            AppCard(child: Row(children: [
              CircleAvatar(radius: 22, backgroundColor: AppColors.primary.withOpacity(0.12), child: const Text('FM', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700))),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('FreshMart QC', style: theme.textTheme.titleSmall),
                Text('4.8 ★ · Verified Employer', style: theme.textTheme.bodySmall),
              ])),
            ])),
            const SizedBox(height: 32),
            PrimaryButton(label: 'Apply for this shift →', onPressed: () => context.go(AppRoutes.applicationSent)),
          ],
        ),
      ),
    );
  }
}
