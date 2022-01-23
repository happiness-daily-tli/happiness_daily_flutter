import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happiness_daily_flutter/components/common/drawer_widget.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:vrouter/vrouter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/common/bottom_navigation_bar_widget.dart';
import 'happiness_theme.dart';
import 'pages/index.dart';

class RouterMyApp extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  _handleDrawer() {
    print(_key.currentState);
    _key.currentState?.openDrawer();
  }

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
                key: _key,
                body: child,
                drawer: DrawerWidget(),
                bottomNavigationBar: BottomNavigaionBarWidget(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.all(0),
                  child: FloatingActionButton(
                    child: SvgPicture.asset('assets/images/footer/tab_1.svg'),
                    onPressed: () => context.vRouter.to('/write'),
                  ),
                ),
              ),
              buildTransition: (animation, _, child) => SlideTransition(
                position: animation.drive(
                  Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(
                    CurveTween(curve: Curves.ease),
                  ),
                ),
                child: child,
              ),
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: MyHappinessPage(handleDrawer: _handleDrawer),
                  buildTransition: (animation, _, child) =>
                      FadeTransition(opacity: animation, child: child),
                ),
                VWidget(
                  path: 'our',
                  widget: OurHappinessPage(),
                  buildTransition: (animation, _, child) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
              ],
            ),
            VWidget(
              path: '/write',
              widget: WritePage(),
              buildTransition: (animation, _, child) => SlideTransition(
                position: animation.drive(
                  Tween(begin: Offset(0.0, 1.0), end: Offset.zero).chain(
                    CurveTween(curve: Curves.ease),
                  ),
                ),
                child: child,
              ),
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
