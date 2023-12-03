import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/router/router.dart';
import '../../main.dart';
import '../../resource/interface/note_pod.dart';

part 'home_pod.g.dart';

@riverpod
class FolderInt extends _$FolderInt {
  @override
  int build() {
    return prefs.getInt('selected') ?? 0;
  }

  void change(int folder) {
    if (state != folder) {
      state = folder;
      prefs.setInt('selected', folder);
    }
    router.pop();
  }

  void order(int folder, int index) {
    final watch = ref.watch(foldersPod);
    if (folder > index || folder == watch.length - 1 && watch.length > 1) {
      state = state - 1;
      prefs.setInt('selected', state);
    }
  }
}
