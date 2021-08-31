import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/page/setting.dart';
import 'package:happiness_daily_flutter/state/user.dart';
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
  _setUserName(state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');

    if (username != null) {
      state = username;
    } else {
      state = '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.read(userProvider);
    _setUserName(user.state);

    return VRouter(
      routes: [
        VGuard(
          beforeEnter: (vRedirector) async {
            final token = await AccessTokenStore.instance.fromStore();
            print(token);
            print(user.state);
            if (token.refreshToken == null)
              vRedirector.to('/login');
            else if (user.state == '') vRedirector.to('/setting');
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
