import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class EarningsOverviewScreen extends StatelessWidget {
  const EarningsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Earnings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Total Earnings', style: TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 6),
                const Text('₱42,800', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('This month', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ]),
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(child: StatCard(label: 'Shifts done', value: '14', subtitle: 'this month')),
              const SizedBox(width: 12),
              Expanded(child: StatCard(label: 'Avg per shift', value: '₱3,057', subtitle: 'per shift')),
            ]),
            SectionHeader(title: 'Recent Payouts', action: 'See all', onAction: () => context.go(AppRoutes.shiftHistory)),
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(children: [
                _PayoutRow(role: 'Cashier · FreshMart', date: 'Apr 3, 2025', amount: '+₱1,020', onTap: () => context.go(AppRoutes.payoutDetail)),
                Divider(height: 1, indent: 16, color: theme.colorScheme.outlineVariant),
                _PayoutRow(role: 'Stock Clerk · MiniStop', date: 'Mar 30, 2025', amount: '+₱918'),
                Divider(height: 1, indent: 16, color: theme.colorScheme.outlineVariant),
                _PayoutRow(role: 'Barista · Brewed Coffee', date: 'Mar 27, 2025', amount: '+₱960'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _PayoutRow extends StatelessWidget {
  final String role, date, amount;
  final VoidCallback? onTap;
  const _PayoutRow({required this.role, required this.date, required this.amount, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      title: Text(role, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
      subtitle: Text(date, style: theme.textTheme.bodySmall),
      trailing: Text(amount, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.success, fontWeight: FontWeight.w600)),
    );
  }
}
