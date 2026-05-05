import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/app_router.dart';
import '../../theme/app_colors.dart';
import '../../widgets/common/app_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? _selectedRole;
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.bolt, color: Colors.white, size: 22),
                  ),
                  const SizedBox(width: 10),
                  Text('QuickShift', style: theme.textTheme.headlineSmall),
                ],
              ),
              const SizedBox(height: 40),
              Text('Welcome!', style: theme.textTheme.displaySmall),
              const SizedBox(height: 8),
              Text(
                'Get started by entering your mobile number.',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 32),

              // Phone number
              AppTextField(
                label: 'Mobile Number',
                hint: '+63 9XX XXX XXXX',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                prefix: const Icon(Icons.phone_outlined, size: 20),
              ),
              const SizedBox(height: 28),

              // Role selector
              Text(
                'I AM A'.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 0.8),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _RoleTile(
                    icon: Icons.work_outline,
                    label: 'Worker',
                    subtitle: 'Find gig shifts',
                    selected: _selectedRole == 'worker',
                    onTap: () => setState(() => _selectedRole = 'worker'),
                  )),
                  const SizedBox(width: 12),
                  Expanded(child: _RoleTile(
                    icon: Icons.business_outlined,
                    label: 'Employer',
                    subtitle: 'Hire instantly',
                    selected: _selectedRole == 'employer',
                    onTap: () => setState(() => _selectedRole = 'employer'),
                  )),
                ],
              ),
              const SizedBox(height: 32),

              PrimaryButton(
                label: 'Get OTP →',
                onPressed: _selectedRole != null && _phoneController.text.isNotEmpty
                    ? () => context.go(
                          '${AppRoutes.otp}?phone=${Uri.encodeComponent(_phoneController.text)}',
                        )
                    : null,
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'By continuing you agree to our Terms & Privacy Policy',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _RoleTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withOpacity(0.1) : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : theme.colorScheme.outline,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: selected ? AppColors.primary : theme.colorScheme.onSurfaceVariant, size: 26),
            const SizedBox(height: 10),
            Text(label, style: theme.textTheme.titleSmall?.copyWith(
              color: selected ? AppColors.primary : null,
              fontWeight: FontWeight.w600,
            )),
            Text(subtitle, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
