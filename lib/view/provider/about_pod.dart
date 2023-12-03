import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'about_pod.g.dart';

final _url = Uri.parse('https://github.com/kurioku/note');

@riverpod
FutureOr<void> git(GitRef ref) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
