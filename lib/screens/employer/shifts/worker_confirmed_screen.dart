import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class WorkerConfirmedScreen extends StatelessWidget {
  const WorkerConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeline = [
      ('Worker notified & confirmed', 'Just now', true),
      ('Marco is on the way', 'Arrives ~1:50 PM', true),
      ('Shift clock-in', '2:00 PM today', false),
      ('Auto-payment released', 'After shift · 8:00 PM', false),
    ];

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
              const SizedBox(height: 16),
              Container(width: 72, height: 72, decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 40)),
              const SizedBox(height: 16),
              Text('Worker Confirmed!', style: theme.textTheme.headlineLarge),
              Text('Marco is on his way. Shift starts 2 PM.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              const SizedBox(height: 24),
              AppCard(child: Column(children: const [
                DetailRow(label: 'Worker', value: 'Marco Reyes'),
                DetailRow(label: 'Role', value: 'Cashier'),
                DetailRow(label: 'Date & Time', value: 'Today, 2:00–8:00 PM'),
                DetailRow(label: 'Location', value: 'SM North EDSA, QC'),
                DetailRow(label: 'Worker pay', value: '₱1,020'),
                DetailRow(label: 'Contact', value: '+63 917 ··· 4821', showDivider: false),
              ])),
              SectionHeader(title: 'What happens next'),
              AppCard(child: Column(
                children: timeline.asMap().entries.map((e) {
                  final i = e.key;
                  final t = e.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Column(children: [
                        Container(width: 12, height: 12, decoration: BoxDecoration(color: t.$3 ? AppColors.primary : theme.colorScheme.surfaceVariant, shape: BoxShape.circle)),
                        if (i < timeline.length - 1) Container(width: 2, height: 30, color: theme.colorScheme.outlineVariant),
                      ]),
                      const SizedBox(width: 16),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(t.$1, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
                        Text(t.$2, style: theme.textTheme.bodySmall),
                      ]),
                    ]),
                  );
                }).toList(),
              )),
              const SizedBox(height: 16),
              PrimaryButton(label: 'Back to Dashboard', onPressed: () => context.go(AppRoutes.employerDashboard)),
            ],
          ),
        ),
      ),
    );
  }
}
