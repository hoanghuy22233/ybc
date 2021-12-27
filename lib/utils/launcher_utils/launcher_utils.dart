import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  static Future<void> launchCaller(String phoneNumber) async {
    var url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchEmail(String email) async {
    var url = "mailto:$email?subject=<subject>&body=<body>";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchBrowser(String httpUrl) async {
    var url;
    if (httpUrl.startsWith('http')) {
    } else {
      url = 'http:$httpUrl';
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
