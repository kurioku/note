import 'package:go_router/go_router.dart';

import '../../resource/model/note.dart';
import '../../view/page/about.dart';
import '../../view/page/editor.dart';
import '../../view/page/home.dart';
import '../../view/page/settings.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (_, __) => const EditorPage(),
        ),
        GoRoute(
          path: 'note',
          builder: (_, state) => EditorPage(
            note: state.extra as Note,
          ),
        ),
        GoRoute(
          path: 'about',
          builder: (_, __) => const AboutPage(),
        ),
        GoRoute(
          path: 'settings',
          builder: (_, __) => const SettingsPage(),
        ),
      ],
    ),
  ],
);
