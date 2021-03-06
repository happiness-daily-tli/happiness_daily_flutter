import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'record_tile.dart';

class RecordListView extends StatelessWidget {
  final List<Record> recordList;

  const RecordListView({
    Key? key,
    required this.recordList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: recordList.length,
      itemBuilder: (context, index) {
        return RecordTile(record: recordList[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 40);
      },
    );
  }
}
