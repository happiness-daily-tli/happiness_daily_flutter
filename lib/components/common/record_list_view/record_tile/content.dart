import 'package:flutter/material.dart';

class RecordTileContent extends StatelessWidget {
  final String content;

  const RecordTileContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content);
  }
}
