import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class SelfieCheckScreen extends StatelessWidget {
  const SelfieCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Liveness Check')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              width: 220, height: 280,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(120),
                border: Border.all(color: AppColors.primary, width: 3),
              ),
              child: Icon(Icons.face, size: 100, color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 32),
            Text('Take a selfie', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Position your face within the oval and ensure good lighting.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant), textAlign: TextAlign.center),
            const Spacer(),
            PrimaryButton(label: 'Take Selfie', icon: Icons.camera_alt_outlined, onPressed: () => context.go(AppRoutes.verifiedProfileWorker)),
            const SizedBox(height: 12),
            AppOutlinedButton(label: 'Upload from gallery', onPressed: () => context.go(AppRoutes.verifiedProfileWorker)),
          ],
        ),
      ),
    );
  }
}
