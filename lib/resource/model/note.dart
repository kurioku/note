import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  factory Note({
    required String id,
    required String title,
    required String body,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}

@freezed
class Folder with _$Folder {
  factory Folder({
    required String id,
    required String title,
    @Default(<Note>[]) List<Note> notes,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}
