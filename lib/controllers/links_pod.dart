import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'links_pod.g.dart';

final _git = Uri.parse('https://github.com/kurioku/note');

@riverpod
FutureOr<void> git(GitRef ref) async {
  if (!await launchUrl(_git)) {
    throw Exception('Could not launch $_git');
  }
}
