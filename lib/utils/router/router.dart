import 'package:go_router/go_router.dart';

import '/models/note.dart';
import '/views/pages/about_page.dart';
import '/views/pages/editor_page.dart';
import '/views/pages/home_page.dart';
import '/views/pages/settings_page.dart';

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
