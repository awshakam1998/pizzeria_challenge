import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzeria_challenge/network/network_service.dart';
import 'package:pizzeria_challenge/utils/theme/theme.dart';
import 'package:pizzeria_challenge/utils/translation.dart';
import 'package:pizzeria_challenge/view/screen/login_screen.dart';
import 'package:pizzeria_challenge/view/widget/no_connection_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      theme: AppTheme.appThemeLight,
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      home: StreamBuilder<NetworkStatus>(
          stream: NetworkStatusService().networkStatusController.stream,
          builder: (context, snapshot) {
            return snapshot.data == NetworkStatus.Online
                ? LoginScreen()
                : NoConnectionWidget();
          }),
    );
  }
}
