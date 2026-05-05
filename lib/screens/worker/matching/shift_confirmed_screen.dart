import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class ShiftConfirmedScreen extends StatelessWidget {
  const ShiftConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(onPressed: () => context.go(AppRoutes.workerHome)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 80, height: 80,
                decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 44),
              ),
              const SizedBox(height: 24),
              Text('Shift Confirmed!', style: theme.textTheme.displaySmall),
              const SizedBox(height: 8),
              Text('FreshMart QC is expecting you', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant), textAlign: TextAlign.center),
              const SizedBox(height: 32),
              AppCard(
                child: Column(
                  children: const [
                    DetailRow(label: 'Role', value: 'Cashier'),
                    DetailRow(label: 'Date & Time', value: 'Today, 2:00–8:00 PM'),
                    DetailRow(label: 'Location', value: 'SM North EDSA, QC'),
                    DetailRow(label: 'Pay', value: '₱1,020', showDivider: false),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(label: 'View my shifts', onPressed: () => context.go(AppRoutes.workerHome)),
            ],
          ),
        ),
      ),
    );
  }
}
