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
          path: 'folder',
          builder: (_, state) => FolderPage(
            index: state.extra as int,
          ),
          routes: [
            GoRoute(
              path: 'note',
              builder: (_, state) => EditorPage(
                note: state.extra as Note,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
