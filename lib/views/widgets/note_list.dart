import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/controllers/note_pod.dart';
import '/controllers/selected_pod.dart';
import '/utils/router/router.dart';
import '../dialogs/delete_note.dart';

class NoteList extends ConsumerWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    final selected = ref.watch(selectedPod);
    if (watch.isEmpty) {
      return const SizedBox();
    } else {
      final notes = watch[selected].notes;
      return ListView.separated(
        separatorBuilder: (_, __) => const Divider(height: 0),
        shrinkWrap: true,
        itemCount: notes.length,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(notes[i].title),
            onTap: () => router.go('/note', extra: notes[i]),
            onLongPress: () {
              showDialog(
                context: context,
                builder: (_) => DeleteNote(note: notes[i]),
              );
            },
          );
        },
      );
    }
  }
}
