import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class VerifiedBusinessScreen extends StatelessWidget {
  const VerifiedBusinessScreen({super.key});

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
          child: Column(
            children: [
              Container(
                width: double.infinity, padding: const EdgeInsets.all(24),
                color: theme.colorScheme.surfaceVariant,
                child: Row(children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    Container(width: 64, height: 64, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.2), borderRadius: BorderRadius.circular(14)), child: const Center(child: Text('FM', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.primary)))),
                    Container(padding: const EdgeInsets.all(3), decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 12)),
                  ]),
                  const SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('FreshMart QC', style: theme.textTheme.titleLarge),
                    StatusBadge(status: ShiftStatus.verified),
                    const SizedBox(height: 4),
                    Text('4.8 ★ · 14 hired · 48s avg match', style: theme.textTheme.bodySmall),
                  ])),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SectionHeader(title: 'Business Details'),
                  AppCard(child: Column(children: const [
                    DetailRow(label: 'Industry', value: 'Grocery / Retail'),
                    DetailRow(label: 'Branch count', value: '3 branches'),
                    DetailRow(label: 'Contact', value: 'Ana Santos, HR', showDivider: false),
                  ])),
                  SectionHeader(title: 'Verification Status'),
                  AppCard(child: Column(children: [
                    DetailRow(label: 'DTI / SEC registration', value: 'Verified'),
                    DetailRow(label: 'Business phone', value: 'Verified'),
                    DetailRow(label: 'Payment method', value: 'Verified'),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Branch address')),
                      Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.warningLight, borderRadius: BorderRadius.circular(20)), child: const Text('Pending', style: TextStyle(color: AppColors.warningDark, fontSize: 12, fontWeight: FontWeight.w600))),
                    ]),
                  ])),
                  const SizedBox(height: 16),
                  PrimaryButton(label: 'Start Hiring →', onPressed: () => context.go(AppRoutes.employerDashboard)),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
