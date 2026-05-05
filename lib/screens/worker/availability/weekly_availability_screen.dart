import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class WeeklyAvailabilityScreen extends StatefulWidget {
  const WeeklyAvailabilityScreen({super.key});
  @override
  State<WeeklyAvailabilityScreen> createState() => _WeeklyAvailabilityScreenState();
}

class _WeeklyAvailabilityScreenState extends State<WeeklyAvailabilityScreen> {
  final _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final Map<String, bool> _selected = {for (var d in ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']) d: false};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Set Availability')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('When are you available?', style: theme.textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text('Select the days you can work. You can update this anytime.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            const SizedBox(height: 32),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: _days.length,
              itemBuilder: (_, i) {
                final day = _days[i];
                final selected = _selected[day]!;
                return GestureDetector(
                  onTap: () => setState(() => _selected[day] = !selected),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primary : theme.colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: selected ? AppColors.primary : theme.colorScheme.outline),
                    ),
                    child: Center(child: Text(day, style: TextStyle(fontWeight: FontWeight.w600, color: selected ? Colors.white : theme.colorScheme.onSurface))),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: () => context.go(AppRoutes.timeRangePicker),
              icon: const Icon(Icons.access_time, size: 18),
              label: const Text('Set specific time ranges'),
            ),
            const Spacer(),
            PrimaryButton(label: 'Save availability', onPressed: () => context.go(AppRoutes.workerHome)),
          ],
        ),
      ),
    );
  }
}
