import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';
import '../shifts/browse_shifts_screen.dart';
import '../earnings/earnings_overview_screen.dart';
import '../settings/worker_settings_screen.dart';

class WorkerHomeScreen extends StatefulWidget {
  const WorkerHomeScreen({super.key});
  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _navIndex,
        children: const [
          _HomeTab(),
          BrowseShiftsScreen(),
          EarningsOverviewScreen(),
          WorkerSettingsScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: theme.colorScheme.outlineVariant, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _navIndex,
          onTap: (i) => setState(() => _navIndex = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), activeIcon: Icon(Icons.search), label: 'Shifts'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), activeIcon: Icon(Icons.account_balance_wallet), label: 'Earnings'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  static const _shifts = [
    {'role': 'Cashier · Today 2–8 PM', 'location': 'SM North EDSA', 'status': 'filled'},
    {'role': 'Stock Clerk · Tomorrow 6–10 PM', 'location': 'Cubao Branch', 'status': 'upcoming'},
  ];

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Good morning 👋', style: theme.textTheme.bodySmall),
                    Text('Juan dela Cruz', style: theme.textTheme.headlineMedium),
                  ]),
                  CircleAvatar(radius: 22, backgroundColor: AppColors.primary.withOpacity(0.15), child: const Text('JD', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700))),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Ready to work?', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 4),
                  const Text('Find a shift near you', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary, minimumSize: const Size(0, 40), padding: const EdgeInsets.symmetric(horizontal: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    onPressed: () => context.go(AppRoutes.browseShifts),
                    child: const Text('Browse Shifts', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ]),
              ),
              const SizedBox(height: 24),
              Row(children: [
                Expanded(child: StatCard(label: 'Total shifts', value: '14', subtitle: 'this month')),
                const SizedBox(width: 12),
                Expanded(child: StatCard(label: 'Earnings', value: '₱8,500', subtitle: 'this month')),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: StatCard(label: 'Rating', value: '4.9 ★', subtitle: 'from employers')),
                const SizedBox(width: 12),
                Expanded(child: StatCard(label: 'Show rate', value: '100%', subtitle: 'on-time')),
              ]),
              SectionHeader(title: 'Upcoming Shifts', action: 'See all', onAction: () {}),
              AppCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: _shifts.asMap().entries.map((entry) {
                    final i = entry.key;
                    final s = entry.value;
                    return Column(children: [
                      ShiftListItem(
                        role: s['role']!, time: '', location: s['location']!,
                        status: s['status'] == 'filled' ? ShiftStatus.filled : ShiftStatus.upcoming,
                        onTap: () => context.go(AppRoutes.shiftDetail),
                      ),
                      if (i < _shifts.length - 1) Divider(height: 1, indent: 68, color: theme.colorScheme.outlineVariant),
                    ]);
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.warningLight, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
                child: Row(children: [
                  const Icon(Icons.badge_outlined, color: AppColors.warning, size: 28),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Verify your ID', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.warningDark)),
                    Text('Unlock more shifts by getting verified', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.warningDark)),
                  ])),
                  TextButton(onPressed: () => context.go(AppRoutes.idUpload), child: Text('Verify', style: TextStyle(color: AppColors.warningDark, fontWeight: FontWeight.w600))),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
