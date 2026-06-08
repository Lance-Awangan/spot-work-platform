import 'package:flutter/material.dart';

import 'routes/app_router.dart';

void main() {
  runApp(const SpotWorkApp());
}

class SpotWorkApp extends StatelessWidget {
  const SpotWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SpotWork',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}