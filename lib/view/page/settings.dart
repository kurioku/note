import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/theme_pod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: const Text('Theme Mode'),
                leading: ref.watch(themeIconPod),
                trailing: DropdownButton(
                  value: ref.watch(themeIntPod),
                  onChanged: (v) => ref.read(themeIntPod.notifier).change(v!),
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('System'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('Light'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('Dark'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
