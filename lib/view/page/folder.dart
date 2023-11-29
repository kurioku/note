import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../resource/interface/note_pod.dart';
import '../../core/router/router.dart';

class FolderPage extends ConsumerWidget {
  const FolderPage({
    super.key,
    required this.id,
    required this.index,
  });

  final int index;
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    final read = ref.read(foldersPod.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(watch[index].title),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: watch[index].notes.length,
          itemBuilder: (_, i) {
            return ListTile(
              title: Text(watch[index].notes[i].title),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: TextField(
                    autofocus: true,
                    onSubmitted: (title) {
                      read.addNote(title, '', watch[index].id);
                      router.pop();
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
