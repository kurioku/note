import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/router.dart';
import '../../resource/interface/note_pod.dart';
import '../provider/home_pod.dart';
import '../widget/edit_folder.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(foldersPod);
    final read = ref.read(foldersPod.notifier);
    final folderInt = ref.read(folderIntPod.notifier);
    final folder = ref.watch(folderIntPod);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: watch.isEmpty ? const Text('Note') : Text(watch[folder].title),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (v) => router.go(v),
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: '/about',
                  child: Text('About'),
                ),
                PopupMenuItem(
                  value: '/settings',
                  child: Text('Settings'),
                ),
              ],
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.create_new_folder, size: 30),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          'New Folder',
                          textAlign: TextAlign.center,
                        ),
                        content: TextField(
                          autofocus: true,
                          onSubmitted: (v) => read.addFolder(v),
                        ),
                      );
                    },
                  );
                },
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: watch.length,
                itemBuilder: (_, i) {
                  return ListTile(
                    selected: i == folder,
                    leading: Icon(
                      i == folder ? Icons.folder_open : Icons.folder,
                    ),
                    title: Text(watch[i].title),
                    onTap: () => folderInt.change(i),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) => EditFolder(
                          selected: watch[i],
                          index: i,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: watch.isEmpty
            ? const SizedBox()
            : ListView.separated(
                separatorBuilder: (_, __) => const Divider(height: 0),
                shrinkWrap: true,
                itemCount: watch[folder].notes.length,
                itemBuilder: (_, i) {
                  return ListTile(
                    title: Text(watch[folder].notes[i].title),
                    onTap: () => router.go(
                      '/note',
                      extra: watch[folder].notes[i],
                    ),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text(
                              'Delete Note',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(watch[folder].notes[i].title),
                            actions: [
                              TextButton(
                                onPressed: () => read.removeNote(
                                  watch[folder].id,
                                  watch[folder].notes[i],
                                ),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
        floatingActionButton: watch.isEmpty
            ? const SizedBox()
            : FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => router.go('/new'),
              ),
      ),
    );
  }
}
