import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/note.dart';
import 'services/storage.dart';
import 'utils/router/router.dart';
import 'utils/theme/theme.dart';
import 'utils/theme/theme_pod.dart';

late final SharedPreferences prefs;
late final List<Folder> list;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  list = await load();
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
