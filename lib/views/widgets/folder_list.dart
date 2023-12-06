import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/controllers/note_pod.dart';
import '/controllers/selected_pod.dart';
import '../dialogs/edit_folder.dart';

class FolderList extends ConsumerWidget {
  const FolderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    final selected = ref.watch(selectedPod);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: watch.length,
      itemBuilder: (_, i) {
        return ListTile(
          selected: i == selected,
          leading: Icon(i == selected ? Icons.folder_open : Icons.folder),
          title: Text(watch[i].title),
          onTap: () => ref.read(selectedPod.notifier).change(i),
          onLongPress: () {
            showDialog(
              context: context,
              builder: (_) => EditFolder(folder: watch[i], i: i),
            );
          },
        );
      },
    );
  }
}
