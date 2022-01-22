import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Music extends StatefulWidget {
  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  bool isShow = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      setState(() {
        isShow = !isShow;
      });
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          'assets/lottie/bgm.json',
          width: 25,
          height: 25,
        ),
        AnimatedOpacity(
          opacity: isShow ? 0.0 : 1.0,
          duration: Duration(seconds: 1),
          child: Column(
            children: [
              Text(
                '음악을 들으며',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '오늘의 행복을 떠올려 보세요',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
