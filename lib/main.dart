import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/pages/setting.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vrouter/vrouter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'happiness_theme.dart';

import 'package:happiness_daily_flutter/pages/login.dart';
import 'package:happiness_daily_flutter/pages/home.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  KakaoContext.clientId = dotenv.env['KAKAO_CLIENTID'] as String;
  KakaoContext.javascriptClientId =
      dotenv.env['KAKAO_JAVASCRIPT_CLIENTID'] as String;
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? usericon = prefs.getString('usericon');

    return username != null ? [username, usericon] : ['', ''];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = HappinessTheme.light();
    final userName = ref.read(userNameProvider);
    final userIcon = ref.read(userIconProvider);

    var isFirstEntry = true;
    var testMode = true;
    var testUserName = true;

    return VRouter(
      theme: theme,
      routes: [
        VGuard(
          beforeEnter: (vRedirector) async {
            if (testMode) {
              // if (isFirstEntry) {
              //   vRedirector.to('/login');
              //   isFirstEntry = false;
              // } else if (testUserName) {
              //   vRedirector.to('/setting');
              //   testUserName = false;
              // }
              vRedirector.to('/setting');
            } else {
              if (isFirstEntry) {
                final token = await AccessTokenStore.instance.fromStore();
                if (token.refreshToken == null) {
                  vRedirector.to('/login');
                  return;
                }
                final List<String> user = await _getUser();
                userName.state = user[0];
                userIcon.state = user[1];
                if (userName.state == '') {
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
