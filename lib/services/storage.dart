import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

import '../models/note.dart';

Future<void> save(List<Folder> folders) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/notes.json');

  final jsonList = folders.map((f) => f.toJson()).toList();
  final jsonString = jsonEncode(jsonList);
  await file.writeAsString(jsonString);
}

Future<List<Folder>> load() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/notes.json');

  if (await file.exists()) {
    final jsonString = await file.readAsString();
    final List jsonList = jsonDecode(jsonString);
    return jsonList.map((f) => Folder.fromJson(f)).toList();
  }

  return [];
}
