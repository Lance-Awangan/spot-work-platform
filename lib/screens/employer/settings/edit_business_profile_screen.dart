import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../widgets/common/app_widgets.dart';

class EditBusinessProfileScreen extends StatelessWidget {
  const EditBusinessProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Business Profile')),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        const SizedBox(height: 8),
        AppTextField(label: 'Business Name', hint: 'FreshMart Superstore'),
        const SizedBox(height: 16),
        AppTextField(label: 'Industry / Type', hint: 'Grocery / Retail'),
        const SizedBox(height: 16),
        AppTextField(label: 'Contact Person', hint: 'Ana Santos'),
        const SizedBox(height: 16),
        AppTextField(label: 'Business Email', hint: 'hr@freshmart.ph', keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 16),
        AppTextField(label: 'Business Phone', hint: '+63 2 8000 0000', keyboardType: TextInputType.phone),
        const SizedBox(height: 32),
        PrimaryButton(label: 'Save changes', onPressed: () => context.go(AppRoutes.employerSettings)),
      ]),
    ),
  );
}
