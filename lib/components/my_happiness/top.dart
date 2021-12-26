import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 76,
      padding: EdgeInsets.fromLTRB(10, 16, 10, 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 100,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/home/speech_bubble.png'),
        ),
      ),
      child: Text(
        '행복하려고 마음 먹은 만큼 행복해질 수 있어요.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
