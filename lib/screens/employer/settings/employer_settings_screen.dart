import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';
import '../../../main.dart';

class EmployerSettingsScreen extends StatelessWidget {
  const EmployerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity, padding: const EdgeInsets.all(24),
                child: Column(children: [
                  Container(width: 64, height: 64, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.15), borderRadius: BorderRadius.circular(14)), child: const Center(child: Text('FM', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary)))),
                  const SizedBox(height: 10),
                  Text('FreshMart QC', style: theme.textTheme.titleLarge),
                  Text('Grocery · Verified Business', style: theme.textTheme.bodySmall),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SectionHeader(title: 'Business'),
                  AppCard(padding: EdgeInsets.zero, child: Column(children: [
                    SettingsListTile(title: 'Business profile', subtitle: 'Name, logo & details', icon: Icons.store_outlined, onTap: () => context.go(AppRoutes.editBusinessProfile)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Verification', subtitle: 'DTI & documents', icon: Icons.verified_outlined, onTap: () => context.go(AppRoutes.documentUpload)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Billing & payments', subtitle: 'Payment method', icon: Icons.credit_card_outlined, onTap: () => context.go(AppRoutes.billing)),
                  ])),
                  SectionHeader(title: 'Hiring'),
                  AppCard(padding: EdgeInsets.zero, child: Column(children: [
                    SettingsListTile(title: 'Shift templates', subtitle: 'Saved shift presets', icon: Icons.grid_view_outlined, onTap: () => context.go(AppRoutes.shiftTemplates)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Worker preferences', subtitle: 'Skills & ratings filter', icon: Icons.tune_outlined, onTap: () => context.go(AppRoutes.workerPreferences)),
                    const Divider(height: 1, indent: 66),
                    Consumer<ThemeNotifier>(builder: (_, n, __) => SettingsListTile(title: 'Dark Mode', icon: Icons.dark_mode_outlined, trailing: Switch(value: n.mode == ThemeMode.dark, onChanged: (_) => n.toggle()))),
                  ])),
                  SectionHeader(title: 'Notifications'),
                  AppCard(padding: EdgeInsets.zero, child: Column(children: [
                    SettingsListTile(title: 'Match alerts', subtitle: 'When worker is found', icon: Icons.notifications_outlined, onTap: () => context.go(AppRoutes.employerNotifications)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Shift reminders', subtitle: 'Before shift starts', icon: Icons.alarm_outlined, onTap: () => context.go(AppRoutes.employerNotifications)),
                  ])),
                  const SizedBox(height: 16),
                  AppOutlinedButton(label: 'Log out', onPressed: () => context.go(AppRoutes.welcome)),
                  const SizedBox(height: 24),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
