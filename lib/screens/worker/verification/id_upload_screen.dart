import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class IdUploadScreen extends StatefulWidget {
  const IdUploadScreen({super.key});
  @override
  State<IdUploadScreen> createState() => _IdUploadScreenState();
}

class _IdUploadScreenState extends State<IdUploadScreen> {
  String? _selectedDoc;
  bool _uploaded = false;

  final _docs = ['Government ID', "Driver's License", 'Passport', 'SSS ID', 'PhilHealth ID'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('ID Verification'), leading: BackButton(onPressed: () => context.go(AppRoutes.workerHome))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upload your ID', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('We need to verify your identity before you can work.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            const SizedBox(height: 24),
            SectionHeader(title: 'Document Type'),
            ..._docs.map((doc) => RadioListTile<String>(
              value: doc, groupValue: _selectedDoc,
              onChanged: (v) => setState(() => _selectedDoc = v),
              title: Text(doc, style: theme.textTheme.bodyMedium),
              activeColor: AppColors.primary,
              contentPadding: EdgeInsets.zero,
            )),
            const SizedBox(height: 16),
            SectionHeader(title: 'Upload Document'),
            GestureDetector(
              onTap: () => setState(() => _uploaded = true),
              child: Container(
                width: double.infinity, height: 140,
                decoration: BoxDecoration(
                  color: _uploaded ? AppColors.successLight : theme.colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _uploaded ? AppColors.success : theme.colorScheme.outline, style: BorderStyle.solid),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_uploaded ? Icons.check_circle : Icons.upload_outlined, size: 36, color: _uploaded ? AppColors.success : theme.colorScheme.onSurfaceVariant),
                    const SizedBox(height: 8),
                    Text(_uploaded ? 'Document uploaded' : 'Tap to upload document', style: theme.textTheme.bodyMedium?.copyWith(color: _uploaded ? AppColors.success : theme.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              label: 'Continue to Selfie →',
              onPressed: _uploaded && _selectedDoc != null ? () => context.go(AppRoutes.selfieCheck) : null,
            ),
          ],
        ),
      ),
    );
  }
}
