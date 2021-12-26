import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/common/icon/music.png',
          width: 14,
          height: 14,
        ),
        SizedBox(height: 10),
        Text(
          '음악을 들으며',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '오늘의 행복을 떠올려 보세요',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
