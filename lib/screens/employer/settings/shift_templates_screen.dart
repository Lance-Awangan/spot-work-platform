import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class ShiftTemplatesScreen extends StatelessWidget {
  const ShiftTemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final templates = [
      {'role': 'Cashier', 'detail': '6 hrs · ₱170/hr', 'note': 'Weekday cashier shift'},
      {'role': 'Stock Clerk', 'detail': '8 hrs · ₱150/hr', 'note': 'Overnight restocking'},
      {'role': 'Kitchen Helper', 'detail': '4 hrs · ₱160/hr', 'note': 'Lunch rush support'},
      {'role': 'Security Guard', 'detail': '12 hrs · ₱180/hr', 'note': 'Full-day security'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shift Templates')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Text('Saved templates speed up posting. Edit, delete or post directly from here.', style: theme.textTheme.bodySmall),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: templates.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final t = templates[i];
                return AppCard(
                  child: Row(children: [
                    Container(width: 4, height: 60, color: AppColors.primary, margin: const EdgeInsets.only(right: 12)),
                    Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.grid_view, color: AppColors.primary, size: 20)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(t['role']!, style: theme.textTheme.titleSmall),
                      Text(t['detail']!, style: theme.textTheme.bodySmall),
                      Text(t['note']!, style: theme.textTheme.bodySmall),
                    ])),
                    TextButton(onPressed: () => context.go(AppRoutes.postShift), child: const Text('Post')),
                    IconButton(icon: const Icon(Icons.edit_outlined, size: 18), onPressed: () {}),
                  ]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppOutlinedButton(label: '+ Create new template', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
