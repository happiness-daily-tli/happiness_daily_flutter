import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vrouter/vrouter.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'bottom_navigation_bar_widget.dart';
import 'drawer_widget.dart';

class HomeScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkKey;
  final Widget child;

  const HomeScaffold({
    Key? key,
    required this.scaffoldkKey,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkKey,
      body: child,
      drawer: DrawerWidget(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: !context.vRouter.path.contains('write')
          ? Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 60,
                width: 60,
                child: FloatingActionButton(
                  backgroundColor: purple,
                  child:
                      SvgPicture.asset('assets/images/footer/tab_center.svg'),
                  onPressed: () => {
                    if (context.vRouter.path == '/')
                      context.vRouter.to('/write'),
                    if (context.vRouter.path == '/our')
                      context.vRouter.to('/our/write')
                  },
                ),
              ),
            )
          : null,
      bottomNavigationBar: !context.vRouter.path.contains('write')
          ? BottomNavigaionBarWidget()
          : null,
    );
  }
}
