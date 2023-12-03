import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/about_pod.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('About')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Version'),
                subtitle: Text('0.1.0'),
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text('Source Code'),
                onTap: () => ref.watch(gitPod),
              ),
              const ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Developed by kurioku'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
