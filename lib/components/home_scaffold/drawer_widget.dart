import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF6B53FF),
            ),
            child: Center(
              child: Text(
                '유니콘님',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('내 계정'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('공지사항'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('앱 설정'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('메일 문의하기'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('행복일기 인스타그램'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
