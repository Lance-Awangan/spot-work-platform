import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class VerifiedWorkerProfileScreen extends StatelessWidget {
  const VerifiedWorkerProfileScreen({super.key});

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(radius: 44, backgroundColor: AppColors.primary.withOpacity(0.15), child: const Text('JD', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.primary))),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                    child: const Icon(Icons.check, color: Colors.white, size: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Juan dela Cruz', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 6),
              StatusBadge(status: ShiftStatus.verified),
              const SizedBox(height: 4),
              Text('4.9 ★ · 14 shifts done · Quezon City', style: theme.textTheme.bodySmall),
              const SizedBox(height: 24),
              AppCard(child: Column(children: const [
                DetailRow(label: 'Government ID', value: 'Verified'),
                DetailRow(label: 'Selfie check', value: 'Verified'),
                DetailRow(label: 'Phone number', value: 'Verified', showDivider: false),
              ])),
              const SizedBox(height: 16),
              SectionHeader(title: 'Skills'),
              Wrap(spacing: 8, runSpacing: 8, children: ['Cashier', 'POS system', 'Customer service'].map((s) => Chip(label: Text(s))).toList()),
              const SizedBox(height: 32),
              PrimaryButton(label: 'Start finding shifts →', onPressed: () => context.go(AppRoutes.browseShifts)),
            ],
          ),
        ),
      ),
    );
  }
}
