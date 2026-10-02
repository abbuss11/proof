import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const ProofApp());
}

class ProofApp extends StatelessWidget {
  const ProofApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'PROOF',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}