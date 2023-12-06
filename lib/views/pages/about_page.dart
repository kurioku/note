import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Version'),
              subtitle: Text('0.1.2'),
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('Source Code'),
              onTap: gitHub,
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Developed by kurioku'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> gitHub() async {
  final github = Uri.parse('https://github.com/kurioku/note');
  if (!await launchUrl(github)) {
    throw Exception('Could not launch $github');
  }
}
