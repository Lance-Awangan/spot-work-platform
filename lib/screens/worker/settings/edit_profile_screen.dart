import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_router.dart';
import '../../../widgets/common/app_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          const SizedBox(height: 8),
          AppTextField(label: 'First Name', hint: 'Juan'),
          const SizedBox(height: 16),
          AppTextField(label: 'Last Name', hint: 'dela Cruz'),
          const SizedBox(height: 16),
          AppTextField(label: 'Email', hint: 'juan@email.com', keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          AppTextField(label: 'Mobile Number', hint: '+63 9XX XXX XXXX', keyboardType: TextInputType.phone),
          const SizedBox(height: 32),
          PrimaryButton(label: 'Save changes', onPressed: () => context.go(AppRoutes.workerSettings)),
        ]),
      ),
    );
  }
}
