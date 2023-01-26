import 'package:url_launcher/url_launcher.dart';

Future<void> openPrivacyOrTerms(String url) async {
  final Uri privacyOrTerms = Uri.parse(url);
  try {
    if (!await launchUrl(privacyOrTerms)) throw Exception();
  } catch (_) {
    print('Unable to open an URL');
  }
}

Future<void> openMail() async {
  final Uri email = Uri(
    scheme: 'mailto',
    path: 'sosodexx@gmail.com',
    queryParameters: {
      'subject': 'PrzepisySylwii',
    },
  );
  try {
    if (!await launchUrl(email)) throw Exception();
  } catch (_) {
    print('Unable to open an URL');
  }
}
