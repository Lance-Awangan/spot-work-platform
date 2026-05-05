import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class WorkerMatchedScreen extends StatelessWidget {
  const WorkerMatchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(onPressed: () => context.go(AppRoutes.employerDashboard)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(width: 70, height: 70, decoration: const BoxDecoration(color: AppColors.successLight, shape: BoxShape.circle), child: const Icon(Icons.check, color: AppColors.success, size: 36)),
              const SizedBox(height: 16),
              Text('Worker Found!', style: theme.textTheme.headlineLarge),
              Text('Matched in 48 seconds · Quezon City', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              const SizedBox(height: 24),

              AppCard(child: Column(children: const [
                DetailRow(label: 'Role', value: 'Cashier'),
                DetailRow(label: 'Time', value: 'Today, 2:00–8:00 PM'),
                DetailRow(label: 'Total pay', value: '₱1,020 to worker', showDivider: false),
              ])),
              const SizedBox(height: 16),

              AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  CircleAvatar(radius: 26, backgroundColor: AppColors.primary.withOpacity(0.15), child: const Text('MR', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700))),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Marco Reyes', style: theme.textTheme.titleMedium),
                    Text('Cashier · 14 shifts done', style: theme.textTheme.bodySmall),
                  ])),
                  Text('4.9 ★', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.warning)),
                ]),
                const Divider(height: 24),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  _WorkerStat(value: '14', label: 'Shifts'),
                  _WorkerStat(value: '1.2km', label: 'Away'),
                  _WorkerStat(value: '100%', label: 'Show rate'),
                ]),
                const Divider(height: 24),
                Wrap(spacing: 8, runSpacing: 8, children: ['Cashier', 'POS system', 'Verified ID'].map((s) => Chip(label: Text(s, style: const TextStyle(fontSize: 12)))).toList()),
              ])),
              const SizedBox(height: 32),
              PrimaryButton(label: 'Confirm Worker →', onPressed: () => context.go(AppRoutes.workerConfirmed)),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkerStat extends StatelessWidget {
  final String value, label;
  const _WorkerStat({required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(children: [
      Text(value, style: theme.textTheme.titleLarge),
      Text(label, style: theme.textTheme.bodySmall),
    ]);
  }
}
