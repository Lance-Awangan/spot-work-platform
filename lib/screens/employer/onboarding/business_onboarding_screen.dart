import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../widgets/common/app_widgets.dart';

class BusinessOnboardingScreen extends StatelessWidget {
  const BusinessOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Set up your', style: theme.textTheme.headlineLarge),
            Text('Business account', style: theme.textTheme.displaySmall),
            const SizedBox(height: 8),
            Text('Fill in details to start hiring instantly.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            const SizedBox(height: 32),
            AppTextField(label: 'Business Name', hint: 'FreshMart QC'),
            const SizedBox(height: 16),
            AppTextField(label: 'Industry / Type', hint: 'Grocery / Retail'),
            const SizedBox(height: 16),
            AppTextField(label: 'Branch Address', hint: 'SM North EDSA, Quezon City'),
            const SizedBox(height: 16),
            AppTextField(label: 'Contact Person', hint: 'Ana Santos'),
            const SizedBox(height: 16),
            AppTextField(label: 'Business Email', hint: 'hr@business.com', keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 32),
            PrimaryButton(label: 'Continue →', onPressed: () => context.go(AppRoutes.documentUpload)),
          ],
        ),
      ),
    );
  }
}
