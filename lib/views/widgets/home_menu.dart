import 'package:flutter/material.dart';

import '/utils/router/router.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (v) => router.go(v),
      itemBuilder: (_) => const [
        PopupMenuItem(
          value: '/about',
          child: Text('About'),
        ),
        PopupMenuItem(
          value: '/settings',
          child: Text('Settings'),
        ),
      ],
    );
  }
}
