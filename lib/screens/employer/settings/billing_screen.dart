import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final transactions = [
      ('Cashier shift · FreshMart', 'Apr 3, 2025', '−₱1,122'),
      ('Account top-up', 'Apr 1, 2025', '+₱5,000'),
      ('Stock Clerk shift', 'Mar 30, 2025', '−₱918'),
      ('Account top-up', 'Mar 28, 2025', '+₱3,000'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Billing & Payments')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppCard(child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Account balance', style: theme.textTheme.bodySmall),
              const SizedBox(height: 4),
              Text('₱5,240.00', style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700)),
              Text('Available for shift payments', style: theme.textTheme.bodySmall),
            ])),
            ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(minimumSize: const Size(80, 40), padding: const EdgeInsets.symmetric(horizontal: 16)), child: const Text('Top up')),
          ])),
          SectionHeader(title: 'Payment Method'),
          AppCard(child: Row(children: [
            Container(width: 44, height: 44, decoration: BoxDecoration(color: theme.colorScheme.surfaceVariant, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.credit_card, size: 22)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('GCash Wallet', style: theme.textTheme.titleSmall),
              Text('+63 917 ··· 4821', style: theme.textTheme.bodySmall),
              Text('Primary method', style: TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w600)),
            ])),
            const Icon(Icons.chevron_right, size: 20),
          ])),
          const SizedBox(height: 8),
          AppOutlinedButton(label: '+ Add payment method', onPressed: () {}),
          SectionHeader(title: 'Recent Transactions'),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(children: transactions.asMap().entries.map((e) {
              final i = e.key;
              final t = e.value;
              return Column(children: [
                ListTile(
                  title: Text(t.$1, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
                  subtitle: Text(t.$2, style: theme.textTheme.bodySmall),
                  trailing: Text(t.$3, style: theme.textTheme.bodyMedium?.copyWith(
                    color: t.$3.startsWith('+') ? AppColors.success : theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                if (i < transactions.length - 1) Divider(height: 1, indent: 16, color: theme.colorScheme.outlineVariant),
              ]);
            }).toList()),
          ),
        ]),
      ),
    );
  }
}
