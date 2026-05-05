import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../widgets/common/app_widgets.dart';

class TimeRangePickerScreen extends StatefulWidget {
  const TimeRangePickerScreen({super.key});
  @override
  State<TimeRangePickerScreen> createState() => _TimeRangePickerScreenState();
}

class _TimeRangePickerScreenState extends State<TimeRangePickerScreen> {
  TimeOfDay _start = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _end = const TimeOfDay(hour: 17, minute: 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Set Time Range')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Set your preferred work hours', style: theme.textTheme.headlineLarge),
            const SizedBox(height: 32),
            Row(children: [
              Expanded(child: _TimePicker(label: 'Start Time', time: _start, onPick: (t) => setState(() => _start = t))),
              const SizedBox(width: 16),
              Expanded(child: _TimePicker(label: 'End Time', time: _end, onPick: (t) => setState(() => _end = t))),
            ]),
            const Spacer(),
            PrimaryButton(label: 'Save', onPressed: () => context.go(AppRoutes.weeklyAvailability)),
          ],
        ),
      ),
    );
  }
}

class _TimePicker extends StatelessWidget {
  final String label;
  final TimeOfDay time;
  final ValueChanged<TimeOfDay> onPick;
  const _TimePicker({required this.label, required this.time, required this.onPick});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label.toUpperCase(), style: theme.textTheme.labelSmall),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () async {
          final picked = await showTimePicker(context: context, initialTime: time);
          if (picked != null) onPick(picked);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: theme.colorScheme.surface, borderRadius: BorderRadius.circular(10), border: Border.all(color: theme.colorScheme.outline)),
          child: Text(time.format(context), style: theme.textTheme.titleMedium),
        ),
      ),
    ]);
  }
}
