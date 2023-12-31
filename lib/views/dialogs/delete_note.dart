import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/controllers/note_pod.dart';
import '/controllers/selected_pod.dart';
import '/models/note.dart';

class DeleteNote extends ConsumerWidget {
  const DeleteNote({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    final selected = ref.watch(selectedPod);
    return AlertDialog(
      title: const Text(
        'Delete Note',
        textAlign: TextAlign.center,
      ),
      content: Text(note.title),
      actions: [
        TextButton(
          onPressed: () {
            final read = ref.read(foldersPod.notifier);
            read.removeNote(watch[selected].id, note);
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
