import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/app_router.dart';
import '../../widgets/common/app_widgets.dart';

class BasicInfoScreen extends StatefulWidget {
  final String role;
  const BasicInfoScreen({super.key, required this.role});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  bool get isEmployer => widget.role == 'employer';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.go(isEmployer ? AppRoutes.businessOnboarding : AppRoutes.workerHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tell us about\nyourself', style: theme.textTheme.displaySmall),
              const SizedBox(height: 8),
              Text(
                isEmployer
                    ? 'Set up your employer account to start hiring.'
                    : 'Complete your profile to start finding shifts.',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 32),

              AppTextField(
                label: 'First Name',
                hint: 'Juan',
                controller: _firstNameCtrl,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Last Name',
                hint: 'dela Cruz',
                controller: _lastNameCtrl,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Email',
                hint: 'juan@email.com',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v!.contains('@') ? null : 'Enter a valid email',
              ),

              if (!isEmployer) ...[
                const SizedBox(height: 16),
                _SkillsSelector(),
              ],

              const SizedBox(height: 32),
              PrimaryButton(label: 'Continue →', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillsSelector extends StatefulWidget {
  @override
  State<_SkillsSelector> createState() => _SkillsSelectorState();
}

class _SkillsSelectorState extends State<_SkillsSelector> {
  final _skills = ['Cashier', 'Stock Clerk', 'Barista', 'Security', 'Kitchen Helper', 'Delivery Rider', 'Warehouse', 'Customer Service'];
  final Set<String> _selected = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SKILLS', style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 0.8)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _skills.map((skill) {
            final selected = _selected.contains(skill);
            return FilterChip(
              label: Text(skill),
              selected: selected,
              onSelected: (v) => setState(() => v ? _selected.add(skill) : _selected.remove(skill)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
