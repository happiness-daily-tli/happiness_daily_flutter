import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:vrouter/vrouter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:happiness_daily_flutter/components/home_scaffold/index.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:happiness_daily_flutter/pages/index.dart';

class RouterMyApp extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldkKey = new GlobalKey<ScaffoldState>();

  _handleDrawer() {
    scaffoldkKey.currentState?.openDrawer();
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username') ?? '';
    String? usericon = prefs.getString('usericon') ?? '';

    return [username, usericon];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = HappinessTheme.light();
    var userName = ref.read(userNameProvider);

    var isFirstEntry = true;
    var testMode = false;
    var testUserName = true;

    return VRouter(
      theme: theme,
      routes: [
        VGuard(
          beforeEnter: (vRedirector) async {
            if (testMode) {
              if (isFirstEntry) {
                vRedirector.to('/login');
                isFirstEntry = false;
              } else if (testUserName) {
                vRedirector.to('/setting/user');
                testUserName = false;
              }
              // vRedirector.to('/setting/alert');
            } else {
              if (isFirstEntry) {
                final token = await AccessTokenStore.instance.fromStore();
                if (token.refreshToken == null) {
                  vRedirector.to('/login');
                  return;
                }
                final List<String> user = await _getUser();
                userName = user[0];
                if (userName == '') {
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
              widgetBuilder: (child) => HomeScaffold(
                scaffoldkKey: scaffoldkKey,
                child: child,
              ),
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: MyHappinessPage(handleDrawer: _handleDrawer),
                  buildTransition: (animation, _, child) => SlideTransition(
                    position: animation.drive(
                      Tween(begin: Offset(-1.0, 0.0), end: Offset.zero).chain(
                        CurveTween(curve: Curves.ease),
                      ),
                    ),
                    child: child,
                  ),
                  stackedRoutes: [
                    VWidget(
                      path: 'write',
                      widget: WriteHappinessPage(),
                      buildTransition: (animation, _, child) => SlideTransition(
                        position: animation.drive(
                          Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
                              .chain(
                            CurveTween(curve: Curves.ease),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ],
                ),
                VWidget(
                  path: 'our',
                  widget: OurHappinessPage(handleDrawer: _handleDrawer),
                  buildTransition: (animation, _, child) => SlideTransition(
                    position: animation.drive(
                      Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(
                        CurveTween(curve: Curves.ease),
                      ),
                    ),
                    child: child,
                  ),
                  stackedRoutes: [
                    VWidget(
                      path: 'write',
                      widget: WriteHappinessPage(),
                      buildTransition: (animation, _, child) => SlideTransition(
                        position: animation.drive(
                          Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
                              .chain(
                            CurveTween(curve: Curves.ease),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
