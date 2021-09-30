import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/page/setting.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vrouter/vrouter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:happiness_daily_flutter/page/login.dart';
import 'package:happiness_daily_flutter/page/home.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  KakaoContext.clientId = dotenv.env['KAKAO_CLIENTID'] as String;
  KakaoContext.javascriptClientId =
      dotenv.env['KAKAO_JAVASCRIPT_CLIENTID'] as String;
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');

    return username != null ? username : '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isFirstEntry = true;
    var testMode = false;
    var testUserName = true;

    return VRouter(
      routes: [
        VGuard(
          beforeEnter: (vRedirector) async {
            if (testMode) {
              if (isFirstEntry) {
                vRedirector.to('/login');
                isFirstEntry = false;
              } else if (testUserName) {
                vRedirector.to('/setting');
                testUserName = false;
              }
            } else {
              if (isFirstEntry) {
                final token = await AccessTokenStore.instance.fromStore();
                if (token.refreshToken == null) {
                  vRedirector.to('/login');
                  return;
                }
                final user = ref.read(userProvider);
                user.state = await _getUserName();
                print(user.state);
                if (user.state == '') {
                  vRedirector.to('/setting');
                  return;
                }
                isFirstEntry = false;
              }
            }
          },
          stackedRoutes: [
            VWidget(path: '/', widget: HomePage()),
          ],
        ),
        VWidget(
          path: '/login',
          widget: LoginPage(),
        ),
        VWidget(
          path: '/setting',
          widget: SettingPage(),
        ),
      ],
    );
  }
}
