import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class ApplicationSentScreen extends StatelessWidget {
  const ApplicationSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(onPressed: () => context.go(AppRoutes.browseShifts)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80, height: 80,
                decoration: const BoxDecoration(color: AppColors.successLight, shape: BoxShape.circle),
                child: const Icon(Icons.send, color: AppColors.success, size: 40),
              ),
              const SizedBox(height: 24),
              Text('Application Sent!', style: theme.textTheme.displaySmall),
              const SizedBox(height: 10),
              Text('The employer will confirm your shift shortly. You will receive a notification once matched.', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant), textAlign: TextAlign.center),
              const SizedBox(height: 32),
              AppCard(child: Column(children: const [
                DetailRow(label: 'Role', value: 'Cashier'),
                DetailRow(label: 'Employer', value: 'FreshMart QC'),
                DetailRow(label: 'Time', value: 'Today, 2:00–8:00 PM'),
                DetailRow(label: 'Status', value: 'Pending match', showDivider: false),
              ])),
              const SizedBox(height: 40),
              PrimaryButton(label: 'Browse more shifts', onPressed: () => context.go(AppRoutes.browseShifts)),
              const SizedBox(height: 12),
              AppOutlinedButton(label: 'Back to Home', onPressed: () => context.go(AppRoutes.workerHome)),
            ],
          ),
        ),
      ),
    );
  }
}
