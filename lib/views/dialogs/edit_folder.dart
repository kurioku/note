import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/note_pod.dart';
import '../../controllers/selected_pod.dart';
import '../../models/note.dart';

class EditFolder extends HookConsumerWidget {
  const EditFolder({
    super.key,
    required this.folder,
    required this.index,
  });

  final Folder folder;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useTextEditingController(text: folder.title);
    final selected = ref.watch(selectedPod);
    return AlertDialog(
      title: const Text(
        'Edit Folder',
        textAlign: TextAlign.center,
      ),
      content: TextField(
        controller: text,
        autofocus: true,
        onSubmitted: (v) {
          final read = ref.read(foldersPod.notifier);
          read.editFolder(folder.id, v);
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            final select = ref.read(selectedPod.notifier);
            final read = ref.read(foldersPod.notifier);
            select.order(selected, index);
            read.removeFolder(folder);
          },
          child: const Text(
            'Delete Folder',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
