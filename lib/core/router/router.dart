import 'package:go_router/go_router.dart';

import '../../resource/model/note.dart';
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
            folder: state.extra as Folder,
          ),
          routes: [
            GoRoute(
              path: 'editor',
              builder: (_, __) => const EditorPage(),
            ),
            GoRoute(
              path: ':note',
              builder: (_, state) => EditorPage(
                id: state.pathParameters['note'],
                note: state.extra as Note,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
