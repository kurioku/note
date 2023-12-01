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

  void addNote(String id, String title) {
    if (title.isNotEmpty) {
      state = [
        for (final folder in state)
          if (folder.id == id)
            folder.copyWith(
              notes: [
                ...folder.notes,
                Note(id: _uuid.v4(), title: title, body: ''),
              ],
            )
          else
            folder
      ];
    }
    router.pop();
  }

  void editNote(String id, String title, String body) {
    if (title.isNotEmpty) {
      state = [
        for (final folder in state)
          folder.copyWith(
            notes: [
              for (final note in folder.notes)
                if (note.id == id)
                  note.copyWith(title: title, body: body)
                else
                  note
            ],
          )
      ];
    }
    router.pop();
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
}
