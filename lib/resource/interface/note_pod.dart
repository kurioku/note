import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../core/router/router.dart';
import '../model/note.dart';

part 'note_pod.g.dart';

const _uuid = Uuid();

@riverpod
class Folders extends _$Folders {
  @override
  List<Folder> build() {
    return [];
  }

  void addFolder(String title) {
    if (title.isNotEmpty) {
      state = [...state, Folder(id: _uuid.v4(), title: title)];
    }
    router.pop();
  }

  void editFolder({required String id, required String title}) {
    if (title.isNotEmpty) {
      state = [
        for (final folder in state)
          if (folder.id == id) folder.copyWith(title: title) else folder
      ];
    }
    router.pop();
  }

  void removeFolder(Folder target) {
    state = state.where((f) => f.id != target.id).toList();
  }

  void addNote(String title, String body, String id) {
    if (title.isNotEmpty) {
      state = [
        for (final folder in state)
          if (folder.id == id)
            folder.copyWith(
              notes: [
                ...folder.notes,
                Note(id: _uuid.v4(), title: title, body: body),
              ],
            )
          else
            folder
      ];
    }
  }

  void editNote({
    required String fID,
    required String nID,
    required String title,
    required String body,
  }) {
    state = [
      for (final folder in state)
        if (folder.id == fID)
          for (final note in folder.notes)
            if (note.id == nID)
              folder.copyWith(
                notes: [
                  note.copyWith(title: title, body: body),
                ],
              )
            else
              folder
    ];
  }

  void removeNote(String id, Note target) {
    state = [
      for (final folder in state)
        if (folder.id == id)
          folder.copyWith(
            notes: [...folder.notes].where((n) => n.id != target.id).toList(),
          )
        else
          folder
    ];
  }

  void updateNote({String? id, String? nID, required title, required body}) {
    final read = ref.read(foldersPod.notifier);
    if (title.isNotEmpty) {
      if (id == null) {
        for (int i = 0; i < state.length; i++) {
          [read.addNote(title, body, state[i].id)];
        }
      } else {
        for (int i = 0; i < state.length; i++) {
          [
            read.editNote(fID: state[i].id, nID: nID!, title: title, body: body)
          ];
        }
      }
      router.pop();
    }
  }
}
