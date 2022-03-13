import 'package:flutter/material.dart';

class RecordTileHeader extends StatelessWidget {
  final Map<String, dynamic> user;

  const RecordTileHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          user['iconUrl'],
          width: 32,
          height: 32,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          user['name'],
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
