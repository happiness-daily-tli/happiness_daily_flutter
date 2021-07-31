import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:happiness_daily_flutter/page/login.dart';
import 'package:happiness_daily_flutter/page/home.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  KakaoContext.clientId = dotenv.env['KAKAO_CLIENTID'] as String;
  KakaoContext.javascriptClientId = dotenv.env['KAKAO_JAVASCRIPT_CLIENTID'] as String;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '행복일기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
