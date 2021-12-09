import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/home/record_tile.dart';
import 'package:happiness_daily_flutter/models/record.dart';

class RecordListView extends StatelessWidget {
  final List<Record> recordList;

  const RecordListView({
    Key? key,
    required this.recordList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: true,
      scrollDirection: Axis.vertical,
      itemCount: recordList.length,
      itemBuilder: (context, index) {
        final volunteer = recordList[index];
        return RecordTile(record: volunteer);
      },
    );
  }
}
