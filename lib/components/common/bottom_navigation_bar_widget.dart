import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        color: Colors.white,
      ),
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(.60),
            selectedFontSize: 10,
            unselectedFontSize: 10, //현재 선택된 Index
            elevation: 0,
            currentIndex: _tabIndex,
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
                label: '행복찾기',
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
          // Container(
          //   height: 20,
          //   color: Colors.white,
          // )
        ],
      ),
    );
  }
}
