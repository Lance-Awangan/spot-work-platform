import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class EmployerDashboardScreen extends StatefulWidget {
  const EmployerDashboardScreen({super.key});
  @override
  State<EmployerDashboardScreen> createState() => _EmployerDashboardScreenState();
}

class _EmployerDashboardScreenState extends State<EmployerDashboardScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _navIndex == 0 ? const _DashboardTab() : _PlaceholderTab(index: _navIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: theme.colorScheme.outlineVariant))),
        child: BottomNavigationBar(
          currentIndex: _navIndex,
          onTap: (i) => setState(() => _navIndex = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), activeIcon: Icon(Icons.add_circle), label: 'Post'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), activeIcon: Icon(Icons.grid_view), label: 'Shifts'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Acct'),
          ],
        ),
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Business account', style: theme.textTheme.bodySmall),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('FreshMart QC', style: theme.textTheme.headlineMedium),
                CircleAvatar(radius: 20, backgroundColor: AppColors.primary.withOpacity(0.15), child: const Text('FM', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 12))),
              ]),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(child: StatCard(label: 'Active shifts', value: '3', subtitle: '2 filling now')),
                const SizedBox(width: 12),
                Expanded(child: StatCard(label: 'Monthly spend', value: '₱42,800', subtitle: '14 workers hired')),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: StatCard(label: 'Avg match', value: '48s', subtitle: 'instant match')),
                const SizedBox(width: 12),
                Expanded(child: StatCard(label: 'Rating', value: '4.8 ★', subtitle: 'from workers')),
              ]),
              const SizedBox(height: 20),
              PrimaryButton(label: '+ Post a Shift', icon: Icons.add, onPressed: () => context.go(AppRoutes.postShift)),
              SectionHeader(title: 'Active Shifts'),
              AppCard(
                padding: EdgeInsets.zero,
                child: Column(children: [
                  ShiftListItem(role: 'Cashier · Today 2–8 PM', time: '', location: 'SM North EDSA', status: ShiftStatus.filled),
                  Divider(height: 1, indent: 68, color: theme.colorScheme.outlineVariant),
                  ShiftListItem(role: 'Stock Clerk · Today 6–10 PM', time: '', location: 'Cubao Branch', status: ShiftStatus.matching),
                  Divider(height: 1, indent: 68, color: theme.colorScheme.outlineVariant),
                  ShiftListItem(role: 'Security · Apr 5 8AM–4PM', time: '', location: 'Main Branch', status: ShiftStatus.upcoming, onTap: () => context.go(AppRoutes.workerMatched)),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final int index;
  const _PlaceholderTab({required this.index});
  @override
  Widget build(BuildContext context) => Center(child: Text('Tab $index', style: Theme.of(context).textTheme.bodyLarge));
}
