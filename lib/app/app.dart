import 'package:flutter/material.dart';
import '../core/config/app_config.dart';
import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class ClientForgeApp extends StatelessWidget {
  const ClientForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
