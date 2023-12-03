import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/selected_pod.dart';
import '../../utils/router/router.dart';
import '../../controllers/note_pod.dart';
import '../dialogs/new_folder.dart';
import '../widgets/folder_list.dart';
import '../widgets/home_menu.dart';
import '../widgets/note_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    final selected = ref.watch(selectedPod);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: watch.isEmpty ? const Text('Note') : Text(watch[selected].title),
        actions: const [
          HomeMenu(),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 32),
            IconButton(
              icon: const Icon(Icons.create_new_folder),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const NewFolder(),
                );
              },
            ),
            const Divider(),
            const FolderList(),
          ],
        ),
      ),
      body: const NoteList(),
      floatingActionButton: Visibility(
        visible: watch.isNotEmpty,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => router.go('/new'),
        ),
      ),
    );
  }
}