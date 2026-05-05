import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  @override
  State<LanguageScreen> createState() => _State();
}
class _State extends State<LanguageScreen> {
  String _lang = 'English';
  final _langs = ['English', 'Filipino', 'Cebuano', 'Ilocano'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: ListView(
        children: _langs.map((l) => RadioListTile<String>(
          value: l, groupValue: _lang,
          onChanged: (v) => setState(() => _lang = v!),
          title: Text(l, style: theme.textTheme.bodyMedium),
          activeColor: AppColors.primary,
        )).toList(),
      ),
    );
  }
}
