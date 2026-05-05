import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';
import '../../../main.dart';

class WorkerSettingsScreen extends StatelessWidget {
  const WorkerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 28),
                child: Column(children: [
                  CircleAvatar(radius: 36, backgroundColor: AppColors.primary.withOpacity(0.15), child: const Text('JD', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary))),
                  const SizedBox(height: 12),
                  Text('Juan dela Cruz', style: theme.textTheme.titleLarge),
                  Text('Cashier · Verified Worker', style: theme.textTheme.bodySmall),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SectionHeader(title: 'Account'),
                  AppCard(padding: EdgeInsets.zero, child: Column(children: [
                    SettingsListTile(title: 'Edit Profile', subtitle: 'Name, photo & details', icon: Icons.person_outline, onTap: () => context.go(AppRoutes.editProfile)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Verification', subtitle: 'ID & documents', icon: Icons.badge_outlined, onTap: () => context.go(AppRoutes.idUpload)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Availability', subtitle: 'Set your work schedule', icon: Icons.calendar_today_outlined, onTap: () => context.go(AppRoutes.weeklyAvailability)),
                  ])),
                  SectionHeader(title: 'Preferences'),
                  AppCard(padding: EdgeInsets.zero, child: Column(children: [
                    SettingsListTile(title: 'Notifications', subtitle: 'Shift alerts & reminders', icon: Icons.notifications_outlined, onTap: () => context.go(AppRoutes.notificationSettings)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Location', subtitle: 'Area & distance preferences', icon: Icons.location_on_outlined, onTap: () => context.go(AppRoutes.locationSettings)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'Language', subtitle: 'English', icon: Icons.language_outlined, onTap: () => context.go(AppRoutes.language)),
                    const Divider(height: 1, indent: 66),
                    Consumer<ThemeNotifier>(
                      builder: (_, notifier, __) => SettingsListTile(
                        title: 'Dark Mode',
                        icon: Icons.dark_mode_outlined,
                        trailing: Switch(value: notifier.mode == ThemeMode.dark, onChanged: (_) => notifier.toggle()),
                      ),
                    ),
                  ])),
                  SectionHeader(title: 'Support'),
                  AppCard(padding: EdgeInsets.zero, child: Column(children: [
                    SettingsListTile(title: 'Help Center', subtitle: 'Worker FAQs', icon: Icons.help_outline, onTap: () => context.go(AppRoutes.helpCenter)),
                    const Divider(height: 1, indent: 66),
                    SettingsListTile(title: 'About QuickShift', subtitle: 'Version 1.0.0', icon: Icons.info_outline, onTap: () => context.go(AppRoutes.about)),
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
