import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('About QuickShift')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          const SizedBox(height: 16),
          Container(width: 72, height: 72, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(18)), child: const Icon(Icons.bolt, color: Colors.white, size: 40)),
          const SizedBox(height: 16),
          Text('QuickShift', style: theme.textTheme.headlineMedium),
          Text('Version 1.0.0', style: theme.textTheme.bodySmall),
          const SizedBox(height: 16),
          Text('Instant gig worker matching for the Philippines.', style: theme.textTheme.bodyMedium, textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
