import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:vrouter/vrouter.dart';

class BottomNavigaionBarWidget extends StatefulWidget {
  @override
  State<BottomNavigaionBarWidget> createState() =>
      _BottomNavigaionBarWidgetState();
}

class _BottomNavigaionBarWidgetState extends State<BottomNavigaionBarWidget> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _setTabIndex(index) {
      setState(() {
        _tabIndex = index;
      });
    }

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: kBottomNavigationBarHeight + 10,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _tabIndex,
            backgroundColor: Colors.red,
            selectedItemColor: purple,
            unselectedItemColor: Colors.black.withOpacity(.60),
            selectedFontSize: 10,
            unselectedFontSize: 10,
            elevation: 0,
            onTap: (int value) {
              if (value == 0) {
                context.vRouter.to('/');
                _setTabIndex(0);
              } else if (value == 2) {
                context.vRouter.to('/our');
                _setTabIndex(2);
              } else {
                context.vRouter.to('/write');
              }
            },
            items: [
              BottomNavigationBarItem(
                label: '나의행복',
                icon: SvgPicture.asset('assets/images/footer/tab_0.svg'),
                activeIcon:
                    SvgPicture.asset('assets/images/footer/tab_0_active.svg'),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset('assets/images/footer/tab_1.svg'),
                activeIcon:
                    SvgPicture.asset('assets/images/footer/tab_1_active.svg'),
              ),
              BottomNavigationBarItem(
                label: '우리의행복',
                icon: SvgPicture.asset('assets/images/footer/tab_2.svg'),
                activeIcon:
                    SvgPicture.asset('assets/images/footer/tab_2_active.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
