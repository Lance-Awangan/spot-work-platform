import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class PayoutDetailScreen extends StatelessWidget {
  const PayoutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Payout Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          Container(
            width: 60, height: 60,
            decoration: const BoxDecoration(color: AppColors.successLight, shape: BoxShape.circle),
            child: const Icon(Icons.account_balance_wallet, color: AppColors.success, size: 28),
          ),
          const SizedBox(height: 16),
          Text('₱1,020', style: theme.textTheme.displaySmall?.copyWith(color: AppColors.success, fontWeight: FontWeight.w700)),
          Text('Paid to GCash · Apr 3, 2025', style: theme.textTheme.bodySmall),
          const SizedBox(height: 24),
          SectionHeader(title: 'Shift Details'),
          AppCard(child: Column(children: const [
            DetailRow(label: 'Role', value: 'Cashier'),
            DetailRow(label: 'Employer', value: 'FreshMart QC'),
            DetailRow(label: 'Date', value: 'April 3, 2025'),
            DetailRow(label: 'Time', value: '2:00 PM – 8:00 PM'),
            DetailRow(label: 'Hours worked', value: '6 hrs', showDivider: false),
          ])),
          const SizedBox(height: 16),
          SectionHeader(title: 'Breakdown'),
          AppCard(child: Column(children: const [
            DetailRow(label: 'Base pay (₱170 × 6h)', value: '₱1,020'),
            DetailRow(label: 'Platform fee', value: '₱0'),
            DetailRow(label: 'Total received', value: '₱1,020', showDivider: false),
          ])),
        ]),
      ),
    );
  }
}
