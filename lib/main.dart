import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/router/router.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Note',
      routerConfig: router,
      themeMode: ThemeMode.system,
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
