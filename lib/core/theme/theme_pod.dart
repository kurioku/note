import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/main.dart';

part 'theme_pod.g.dart';

@riverpod
class ThemeInt extends _$ThemeInt {
  @override
  int build() {
    return prefs.getInt('theme') ?? 0;
  }

  void change(int value) {
    state = value;
    prefs.setInt('theme', value);
  }
}

@riverpod
ThemeMode theme(ThemeRef ref) {
  final value = ref.watch(themeIntPod);
  return ThemeMode.values[value];
}

@riverpod
Icon themeIcon(ThemeIconRef ref) {
  final value = ref.watch(themeIntPod);

  if (value == 0) {
    return const Icon(Icons.brightness_6_outlined);
  } else if (value == 1) {
    return const Icon(Icons.brightness_7);
  }
  return const Icon(Icons.brightness_4_outlined);
}
