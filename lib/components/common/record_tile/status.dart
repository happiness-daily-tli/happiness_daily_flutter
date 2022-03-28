import 'package:flutter/material.dart';

class RecordTileStatus extends StatelessWidget {
  final Function onChangeIsHeart;
  final bool isHeart;
  final int heartCount;
  final int commentLength;

  const RecordTileStatus({
    Key? key,
    required this.onChangeIsHeart,
    required this.isHeart,
    required this.heartCount,
    required this.commentLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChangeIsHeart(),
          child: Container(
            width: 43,
            child: Row(
              children: [
                Image.asset(
                  isHeart
                      ? 'assets/images/common/icon/heart.png'
                      : 'assets/images/common/icon/heart_disabled.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(heartCount.toString()),
              ],
            ),
          ),
        ),
        Container(
          width: 43,
          child: Row(
            children: [
              Image.asset(
                'assets/images/common/icon/comment.png',
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 2,
              ),
              Text(commentLength.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
