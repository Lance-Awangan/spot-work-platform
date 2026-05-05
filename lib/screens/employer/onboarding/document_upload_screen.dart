import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});
  @override
  State<DocumentUploadScreen> createState() => _State();
}

class _State extends State<DocumentUploadScreen> {
  String? _selected = 'DTI Registration';
  bool _uploaded = false;
  final _docs = [['DTI Registration', 'SEC Certificate'], ['BIR Form 2303', 'Business Permit']];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Business Verification')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Business verification', style: theme.textTheme.headlineMedium),
          SectionHeader(title: 'Document Type'),
          ..._docs.map((row) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(children: row.map((d) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: d == row.first ? 8 : 0),
                child: GestureDetector(
                  onTap: () => setState(() => _selected = d),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: _selected == d ? AppColors.primary.withOpacity(0.1) : theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: _selected == d ? AppColors.primary : theme.colorScheme.outline, width: _selected == d ? 2 : 1),
                    ),
                    child: Text(d, style: TextStyle(fontSize: 13, color: _selected == d ? AppColors.primary : null)),
                  ),
                ),
              ),
            )).toList()),
          )),
          SectionHeader(title: 'Upload Document'),
          GestureDetector(
            onTap: () => setState(() => _uploaded = true),
            child: Container(
              width: double.infinity, height: 120,
              decoration: BoxDecoration(color: _uploaded ? AppColors.successLight : theme.colorScheme.surfaceVariant, borderRadius: BorderRadius.circular(12), border: Border.all(color: _uploaded ? AppColors.success : theme.colorScheme.outline)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(_uploaded ? Icons.check_circle : Icons.upload_outlined, size: 32, color: _uploaded ? AppColors.success : theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 8),
                Text(_uploaded ? 'Document uploaded' : 'Tap to upload', style: theme.textTheme.bodyMedium),
              ]),
            ),
          ),
          SectionHeader(title: 'Payment Method'),
          AppCard(child: Row(children: [
            const Icon(Icons.account_balance_wallet_outlined, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('GCash / Bank account', style: theme.textTheme.bodyMedium),
              Text('Linked', style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.w600)),
            ])),
            const Icon(Icons.check_circle, color: AppColors.success, size: 20),
          ])),
          const SizedBox(height: 32),
          PrimaryButton(label: 'Submit for verification →', onPressed: _uploaded ? () => context.go(AppRoutes.verifiedBusiness) : null),
        ]),
      ),
    );
  }
}
