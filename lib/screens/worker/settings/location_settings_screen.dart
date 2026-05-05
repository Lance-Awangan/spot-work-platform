import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/common/app_widgets.dart';

class LocationSettingsScreen extends StatefulWidget {
  const LocationSettingsScreen({super.key});
  @override
  State<LocationSettingsScreen> createState() => _State();
}
class _State extends State<LocationSettingsScreen> {
  double _radius = 5;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Location')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Search radius', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text('Show shifts within ${_radius.round()} km', style: theme.textTheme.bodySmall),
          Slider(value: _radius, min: 1, max: 20, divisions: 19, activeColor: AppColors.primary, onChanged: (v) => setState(() => _radius = v)),
          const SizedBox(height: 24),
          AppTextField(label: 'Home Location', hint: 'Quezon City, Metro Manila'),
          const SizedBox(height: 32),
          PrimaryButton(label: 'Save', onPressed: () => Navigator.pop(context)),
        ]),
      ),
    );
  }
}
