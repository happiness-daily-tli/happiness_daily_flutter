import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'record_tile/index.dart';

class RecordListCardView extends StatelessWidget {
  final List<Record> recordList;

  const RecordListCardView({
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: RecordTile(record: recordList[index]),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 40);
      },
    );
  }
}
