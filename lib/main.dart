import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/subjects.dart';

import 'app/constants/barrel_constants.dart';
import 'app/my_app.dart';
import 'app_config.dart';
import 'model/local/barrel_local.dart';
import 'presentation/router.dart';

GetIt getIt = GetIt.instance;

//Local notification

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = LocalPref();
  var token = await prefs.getString(AppPreferences.auth_token);
  print('----Token Shared: ${token ?? "is null"}');
  MyApp.initSystemDefault();

  runApp(
    AppConfig(
      appName: "Ybc",
      debugTag: false,
      flavorName: "prod",
      initialRoute: BaseRouter.SPLASH,
      child: MyApp.runWidget(token),
    ),
  );
}
