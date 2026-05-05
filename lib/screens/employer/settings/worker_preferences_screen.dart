import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class WorkerPreferencesScreen extends StatefulWidget {
  const WorkerPreferencesScreen({super.key});
  @override
  State<WorkerPreferencesScreen> createState() => _State();
}
class _State extends State<WorkerPreferencesScreen> {
  double _minRating = 4.5;
  bool _verifiedOnly = true;
  double _minShowRate = 85;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Worker Preferences')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Filter the workers QuickShift matches you with.', style: theme.textTheme.bodySmall),
          SectionHeader(title: 'Minimum Rating'),
          AppCard(child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Minimum worker rating', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
                Text('Only match workers rated this or higher', style: theme.textTheme.bodySmall),
              ]),
              Text('${_minRating.toStringAsFixed(1)} ★', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.warning)),
            ]),
            const SizedBox(height: 8),
            Slider(value: _minRating, min: 3, max: 5, divisions: 20, activeColor: AppColors.primary, label: _minRating.toStringAsFixed(1), onChanged: (v) => setState(() => _minRating = v)),
          ])),
          SectionHeader(title: 'Verification Required'),
          AppCard(child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Only show verified workers', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
              Text('Workers with verified ID only', style: theme.textTheme.bodySmall),
            ])),
            Switch(value: _verifiedOnly, activeColor: AppColors.primary, onChanged: (v) => setState(() => _verifiedOnly = v)),
          ])),
          SectionHeader(title: 'Show Rate Minimum'),
          AppCard(child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Minimum show rate', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
              Text('Exclude workers who no-show frequently', style: theme.textTheme.bodySmall),
            ])),
            Text('${_minShowRate.round()}%', style: theme.textTheme.titleMedium),
          ])),
          const SizedBox(height: 32),
          PrimaryButton(label: 'Save preferences', onPressed: () => context.go(AppRoutes.employerSettings)),
        ]),
      ),
    );
  }
}
