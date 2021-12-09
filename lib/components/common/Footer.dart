import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Footer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);

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
            onTap: (int index) => tabIndex.state = index,
            currentIndex: tabIndex.state,
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
