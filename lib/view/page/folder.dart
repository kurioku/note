import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/router.dart';
import '../../resource/interface/note_pod.dart';

class FolderPage extends ConsumerWidget {
  const FolderPage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(watch[index].title)),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: watch[index].notes.length,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(watch[index].notes[i].title),
            onTap: () => router.push('/id/note', extra: watch[index].notes[i]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => router.push('/id/editor'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
