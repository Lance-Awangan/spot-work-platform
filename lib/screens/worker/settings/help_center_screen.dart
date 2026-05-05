import 'package:flutter/material.dart';
import '../../../widgets/common/app_widgets.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final faqs = [
      ('How do I apply for a shift?', 'Browse shifts, tap one, and press Apply.'),
      ('When will I get paid?', 'Payment is released automatically after your shift ends.'),
      ('How do I verify my ID?', 'Go to Settings > Verification and follow the steps.'),
      ('Can I cancel a confirmed shift?', 'Yes, but repeated cancellations may lower your rating.'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (_, i) => AppCard(
          padding: EdgeInsets.zero,
          child: ExpansionTile(
            title: Text(faqs[i].$1, style: theme.textTheme.titleSmall),
            children: [Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 16), child: Text(faqs[i].$2, style: theme.textTheme.bodyMedium))],
          ),
        ),
      ),
    );
  }
}
