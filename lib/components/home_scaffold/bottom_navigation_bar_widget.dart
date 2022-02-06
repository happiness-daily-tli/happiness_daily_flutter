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

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 18,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomAppBar(
          color: Colors.white,
          elevation: 20,
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 0,
          child: Container(
            height: kBottomNavigationBarHeight + 10,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: _tabIndex,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              unselectedItemColor: disabled,
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
              ),
              elevation: 0,
              onTap: (int value) {
                if (value == 0) {
                  _setTabIndex(0);
                  context.vRouter.to('/');
                } else if (value == 1) {
                  _setTabIndex(1);
                  context.vRouter.to('/our');
                }
              },
              items: [
                BottomNavigationBarItem(
                  label: '나의행복',
                  icon: SvgPicture.asset('assets/images/footer/tab_0.svg'),
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                        'assets/images/footer/tab_0_active.svg'),
                  ),
                ),
                BottomNavigationBarItem(
                  label: '우리의행복',
                  icon: SvgPicture.asset('assets/images/footer/tab_1.svg'),
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                        'assets/images/footer/tab_1_active.svg'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
