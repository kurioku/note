import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/controllers/note_pod.dart';
import '/controllers/selected_pod.dart';
import '/models/note.dart';

class EditorPage extends HookConsumerWidget {
  const EditorPage({
    super.key,
    this.note,
  });

  final Note? note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useTextEditingController(text: note?.title);
    final body = useTextEditingController(text: note?.body);
    final focus = useFocusNode();
    final watch = ref.watch(foldersPod);
    final selected = ref.watch(selectedPod);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.save),
          onPressed: () {
            final read = ref.read(foldersPod.notifier);
            if (note == null) {
              read.write(null, watch[selected].id, title.text, body.text);
            } else {
              read.write(note!.id, watch[selected].id, title.text, body.text);
            }
          },
        ),
        title: TextField(
          controller: title,
          autofocus: true,
          onEditingComplete: focus.requestFocus,
          decoration: const InputDecoration.collapsed(hintText: 'Title'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: body,
          focusNode: focus,
          expands: true,
          maxLines: null,
          minLines: null,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
