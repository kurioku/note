import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/controllers/note_pod.dart';
import '/controllers/selected_pod.dart';
import '/models/note.dart';

class EditFolder extends HookConsumerWidget {
  const EditFolder({
    super.key,
    required this.folder,
    required this.i,
  });

  final Folder folder;
  final int i;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useTextEditingController(text: folder.title);
    return AlertDialog(
      title: const Text(
        'Edit Folder',
        textAlign: TextAlign.center,
      ),
      content: TextField(
        controller: text,
        autofocus: true,
        onSubmitted: (v) {
          ref.read(foldersPod.notifier).editFolder(folder.id, v);
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            ref.read(selectedPod.notifier).order(i);
            ref.read(foldersPod.notifier).removeFolder(folder);
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
