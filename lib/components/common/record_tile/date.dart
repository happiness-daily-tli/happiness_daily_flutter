import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordTileDate extends StatelessWidget {
  final String date;

  const RecordTileDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataFormat = new DateFormat('yyyy.MM.dd');

    return Text(
      dataFormat.format(DateTime.parse(date)),
      style: TextStyle(
        color: Color(0xFF999999),
      ),
    );
  }
}
