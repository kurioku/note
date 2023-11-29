import 'package:go_router/go_router.dart';

import '../../view/page/editor.dart';
import '../../view/page/folder.dart';
import '../../view/page/home.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (_, state) => FolderPage(
            id: state.pathParameters['id']!,
            index: state.extra as int,
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (_, state) => const EditorPage(),
            )
          ],
        ),
      ],
    ),
  ],
);
