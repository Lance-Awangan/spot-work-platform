import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class BrowseShiftsScreen extends StatefulWidget {
  const BrowseShiftsScreen({super.key});
  @override
  State<BrowseShiftsScreen> createState() => _BrowseShiftsScreenState();
}

class _BrowseShiftsScreenState extends State<BrowseShiftsScreen> {
  String _selectedFilter = 'All';
  final _filters = ['All', 'Cashier', 'Stock Clerk', 'Barista', 'Security', 'Kitchen'];
  final _shifts = [
    {'role': 'Cashier', 'company': 'FreshMart QC', 'time': 'Today 2–8 PM', 'location': 'SM North EDSA, QC', 'pay': '₱1,020', 'distance': '0.8km'},
    {'role': 'Stock Clerk', 'company': 'MiniStop', 'time': 'Today 10 PM–6 AM', 'location': 'Cubao, QC', 'pay': '₱1,200', 'distance': '1.2km'},
    {'role': 'Barista', 'company': 'Brewed Coffee', 'time': 'Tomorrow 7 AM–3 PM', 'location': 'Katipunan Ave', 'pay': '₱960', 'distance': '2.1km'},
    {'role': 'Security Guard', 'company': 'SM Malls', 'time': 'Apr 6 8 AM–8 PM', 'location': 'SM Fairview', 'pay': '₱2,160', 'distance': '4.5km'},
    {'role': 'Kitchen Helper', 'company': 'Jollibee', 'time': 'Today 11 AM–3 PM', 'location': 'Commonwealth', 'pay': '₱640', 'distance': '1.8km'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = _selectedFilter == 'All' ? _shifts : _shifts.where((s) => s['role']!.contains(_selectedFilter)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Shifts'),
        actions: [IconButton(icon: const Icon(Icons.tune), onPressed: () {})],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _filters.length,
              itemBuilder: (_, i) {
                final f = _filters[i];
                final selected = _selectedFilter == f;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(f),
                    selected: selected,
                    onSelected: (_) => setState(() => _selectedFilter = f),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final s = filtered[i];
                return AppCard(
                  onTap: () => context.go(AppRoutes.shiftDetail),
                  child: Row(
                    children: [
                      Container(
                        width: 48, height: 48,
                        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.work_outline, color: AppColors.primary),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s['role']!, style: theme.textTheme.titleSmall),
                            Text(s['company']!, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.primary)),
                            const SizedBox(height: 4),
                            Text(s['time']!, style: theme.textTheme.bodySmall),
                            Text(s['location']!, style: theme.textTheme.bodySmall),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(s['pay']!, style: theme.textTheme.titleMedium?.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 4),
                          Text(s['distance']!, style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
