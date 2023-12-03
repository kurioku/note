import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../resource/interface/note_pod.dart';
import '../../resource/model/note.dart';
import '../provider/home_pod.dart';

class EditorPage extends HookConsumerWidget {
  const EditorPage({super.key, this.note});

  final Note? note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useTextEditingController(text: note?.title);
    final body = useTextEditingController(text: note?.body);
    final focus = useFocusNode();
    final read = ref.read(foldersPod.notifier);
    final watch = ref.watch(foldersPod);
    final folder = ref.watch(folderIntPod);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (note == null) {
                read.write(null, watch[folder].id, title.text, body.text);
              } else {
                read.write(note!.id, watch[folder].id, title.text, body.text);
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
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: body,
            focusNode: focus,
            expands: true,
            maxLines: null,
            minLines: null,
            decoration: const InputDecoration(border: InputBorder.none),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
