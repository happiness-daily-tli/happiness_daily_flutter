import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      appBar: AppBar(title: Text('행복일기')),
      // TODO : Show List, Edit
      body: Text('${user.state}님 안녕하세요.'),
      bottomNavigationBar: SizedBox(
        height: 83,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(.60),
          selectedFontSize: 10,
          unselectedFontSize: 10, //현재 선택된 Index
          onTap: (int index) => tabIndex.state = index,
          currentIndex: tabIndex.state,
          items: [
            BottomNavigationBarItem(
              label: '나의행복',
              icon: SvgPicture.asset('assets/tab_0.svg'),
              activeIcon: SvgPicture.asset('assets/tab_0_active.svg'),
            ),
            BottomNavigationBarItem(
              label: '행복찾기',
              icon: SvgPicture.asset('assets/tab_1.svg'),
              activeIcon: SvgPicture.asset('assets/tab_1_active.svg'),
            ),
            BottomNavigationBarItem(
              label: '우리의행복',
              icon: SvgPicture.asset('assets/tab_2.svg'),
              activeIcon: SvgPicture.asset('assets/tab_2_active.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
