import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:vrouter/vrouter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/common/footer.dart';
import 'happiness_theme.dart';
import 'pages/index.dart';

class RouterMyApp extends ConsumerWidget {
  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') as String;
    String usericon = prefs.getString('usericon') as String;

    return [username, usericon];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = HappinessTheme.light();
    final userName = ref.read(userNameProvider);
    final userIcon = ref.read(userIconProvider);

    var isFirstEntry = true;
    var testMode = false;
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
              vRedirector.to('/setting/user');
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
                  vRedirector.to('/setting/user');
                  return;
                }
                isFirstEntry = false;
              }
            }
          },
          stackedRoutes: [
            VNester(
              path: '/',
              widgetBuilder: (child) => Scaffold(
                body: child,
                bottomNavigationBar: Footer(),
              ),
              nestedRoutes: [
                VWidget(path: null, widget: MyHappinessPage()), //
                VWidget(path: 'our', widget: OurHappinessPage()), //
              ],
            ),
            VWidget(path: '/write', widget: WritePage()),
          ],
        ),
        VWidget(
          path: '/login',
          widget: LoginPage(),
        ),
        VWidget(
          path: '/setting/user',
          widget: SettingUserPage(),
        ),
        VWidget(
          path: '/setting/alert',
          widget: SettingAlertPage(),
        ),
      ],
    );
  }
}
