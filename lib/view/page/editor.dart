import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note/resource/interface/note_pod.dart';

import '../../resource/model/note.dart';

class EditorPage extends HookConsumerWidget {
  const EditorPage({
    super.key,
    this.note,
  });

  final Note? note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useTextEditingController(text: note?.title ?? '');
    final body = useTextEditingController(text: note?.body ?? '');
    final focus = useFocusNode();
    final read = ref.read(foldersPod.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.save),
          onPressed: () {
            if (note == null) {
              read.write(title: title.text, body: body.text);
            } else {
              read.write(id: note!.id, title: title.text, body: body.text);
            }
          },
        ),
        title: TextField(
          controller: title,
          decoration: const InputDecoration.collapsed(
            hintText: 'Title',
            hintStyle: TextStyle(color: Colors.white24),
          ),
          autofocus: true,
          onEditingComplete: focus.requestFocus,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: body,
          focusNode: focus,
          expands: true,
          maxLines: null,
          minLines: null,
          decoration: const InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
