import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/router.dart';
import '../../resource/interface/note_pod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    final read = ref.read(foldersPod.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Note'),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: watch.length,
          itemBuilder: (_, i) {
            return ListTile(
              title: Text(watch[i].title),
              onTap: () => router.push('/id', extra: i),
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
                      read.addFolder(title);
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
