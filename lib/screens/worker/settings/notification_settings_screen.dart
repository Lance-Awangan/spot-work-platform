import 'package:flutter/material.dart';
import '../../../widgets/common/app_widgets.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});
  @override
  State<NotificationSettingsScreen> createState() => _State();
}
class _State extends State<NotificationSettingsScreen> {
  final _settings = {
    'Shift matched': true,
    'Shift confirmed': true,
    'No match found': false,
    'Shift reminders': true,
    'Payment received': true,
    'Platform updates': false,
  };
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _settings.entries.map((e) => SwitchListTile(
          value: e.value,
          onChanged: (v) => setState(() => _settings[e.key] = v),
          title: Text(e.key, style: theme.textTheme.bodyMedium),
          activeColor: const Color(0xFF00C853),
        )).toList(),
      ),
    );
  }
}
