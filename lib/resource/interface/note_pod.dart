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

  void editFolder(String id, String title) {
    if (title.isNotEmpty) {
      state = [
        for (final folder in state)
          if (folder.id == id) folder.copyWith(title: title) else folder
      ];
    }
    router.pop();
  }

  void removeFolder(Folder target) {
    state = [...state].where((f) => f.id != target.id).toList();
  }

  void addNote(String id, String title, String body) {
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
    required String f,
    required String n,
    required String title,
    required String body,
  }) {
    state = [
      for (final folder in state)
        if (folder.id == f)
          folder.copyWith(
            notes: [
              for (final note in folder.notes)
                if (note.id == n)
                  note.copyWith(title: title, body: body)
                else
                  note
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

  void write({String? id, required String title, required String body}) {
    if (title.isNotEmpty) {
      if (id == null) {
        for (int i = 0; i < state.length; i++) {
          addNote(title, body, state[i].id);
        }
      } else {
        for (int i = 0; i < state.length; i++) {
          editNote(f: state[i].id, n: id, title: title, body: body);
        }
      }
    }
    router.pop();
  }
}
