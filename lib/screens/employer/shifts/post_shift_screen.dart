import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class PostShiftScreen extends StatefulWidget {
  const PostShiftScreen({super.key});
  @override
  State<PostShiftScreen> createState() => _PostShiftScreenState();
}

class _PostShiftScreenState extends State<PostShiftScreen> {
  int _step = 0;
  String? _role;
  final _roles = ['Cashier', 'Stock Clerk', 'Barista', 'Security', 'Kitchen Helper', 'Delivery Rider'];
  int _workers = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Post a Shift'), leading: BackButton(onPressed: () => context.go(AppRoutes.employerDashboard))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(3, (i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(children: [
                CircleAvatar(radius: 14, backgroundColor: i <= _step ? AppColors.primary : theme.colorScheme.surfaceVariant, child: Text('${i+1}', style: TextStyle(fontSize: 12, color: i <= _step ? Colors.white : theme.colorScheme.onSurfaceVariant))),
                if (i < 2) Container(width: 60, height: 2, color: i < _step ? AppColors.primary : theme.colorScheme.surfaceVariant),
              ]),
            ))),
            const SizedBox(height: 32),

            SectionHeader(title: 'Role Needed'),
            Wrap(spacing: 8, runSpacing: 8, children: _roles.map((r) => FilterChip(
              label: Text(r), selected: _role == r,
              onSelected: (_) => setState(() => _role = r),
            )).toList()),
            const SizedBox(height: 20),

            SectionHeader(title: 'Shift Date & Time'),
            Row(children: [
              Expanded(child: AppTextField(label: 'Date', hint: 'Today, Apr 3')),
              const SizedBox(width: 12),
              Expanded(child: AppTextField(label: 'Start Time', hint: '2:00 PM')),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: AppTextField(label: 'End Time', hint: '8:00 PM')),
              const SizedBox(width: 12),
              Expanded(child: AppTextField(label: 'Duration', hint: '6 hours')),
            ]),
            const SizedBox(height: 20),

            SectionHeader(title: 'Workers Needed'),
            AppCard(child: Row(children: [
              IconButton(icon: const Icon(Icons.remove), onPressed: () { if (_workers > 1) setState(() => _workers--); }),
              Expanded(child: Center(child: Text('$_workers worker${_workers > 1 ? 's' : ''}', style: theme.textTheme.titleMedium))),
              IconButton(icon: const Icon(Icons.add), onPressed: () => setState(() => _workers++)),
            ])),
            const SizedBox(height: 16),
            AppTextField(label: 'Hourly Rate (₱)', hint: '170'),
            const SizedBox(height: 20),

            AppCard(child: Column(children: const [
              DetailRow(label: 'Hours', value: '6 hrs'),
              DetailRow(label: 'Rate', value: '₱170/hr'),
              DetailRow(label: 'Platform fee', value: '₱102'),
              DetailRow(label: 'Total cost', value: '₱1,122', showDivider: false),
            ])),
            const SizedBox(height: 32),

            PrimaryButton(label: 'Find Workers Now →', onPressed: _role != null ? () => context.go(AppRoutes.workerMatched) : null),
          ],
        ),
      ),
    );
  }
}
