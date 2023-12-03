import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../resource/interface/note_pod.dart';
import '../../resource/model/note.dart';
import '../provider/home_pod.dart';

class EditFolder extends HookConsumerWidget {
  const EditFolder({
    super.key,
    required this.selected,
    required this.index,
  });

  final Folder selected;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(foldersPod.notifier);
    final folder = ref.watch(folderIntPod);
    final folderInt = ref.read(folderIntPod.notifier);
    final text = useTextEditingController(text: selected.title);
    return AlertDialog(
      title: const Text(
        'Edit Folder',
        textAlign: TextAlign.center,
      ),
      content: TextField(
        controller: text,
        autofocus: true,
        onSubmitted: (v) => read.editFolder(selected.id, v),
      ),
      actions: [
        TextButton(
          onPressed: () {
            folderInt.order(folder, index);
            read.removeFolder(selected);
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
