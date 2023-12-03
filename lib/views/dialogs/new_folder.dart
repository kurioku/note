import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/note_pod.dart';

class NewFolder extends ConsumerWidget {
  const NewFolder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text(
        'New Folder',
        textAlign: TextAlign.center,
      ),
      content: TextField(
        autofocus: true,
        onSubmitted: (v) {
          final read = ref.read(foldersPod.notifier);
          read.addFolder(v);
        },
      ),
    );
  }
}
