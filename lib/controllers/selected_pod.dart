import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/router/router.dart';
import '../../main.dart';
import 'note_pod.dart';

part 'selected_pod.g.dart';

@riverpod
class Selected extends _$Selected {
  @override
  int build() {
    return prefs.getInt('selected') ?? 0;
  }

  void change(int selected) {
    if (state != selected) {
      state = selected;
      prefs.setInt('selected', state);
    }
    router.pop();
  }

  void order(int i) {
    final watch = ref.watch(foldersPod);
    if (state > i || state == watch.length - 1 && watch.length > 1) {
      state = state - 1;
      prefs.setInt('selected', state);
    }
  }
}
