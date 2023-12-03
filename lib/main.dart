import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'core/theme/theme_pod.dart';

late final SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Note',
      routerConfig: router,
      themeMode: ref.watch(themePod),
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
