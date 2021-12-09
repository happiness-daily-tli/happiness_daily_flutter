import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/record.dart';

class RecordTile extends StatelessWidget {
  final Record record;

  const RecordTile({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('text');
  }
}
