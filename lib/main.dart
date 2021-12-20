import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/router.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  KakaoContext.clientId = dotenv.env['KAKAO_CLIENTID'] as String;
  KakaoContext.javascriptClientId =
      dotenv.env['KAKAO_JAVASCRIPT_CLIENTID'] as String;

  runApp(
    ProviderScope(
      child: RouterMyApp(),
    ),
  );
}
