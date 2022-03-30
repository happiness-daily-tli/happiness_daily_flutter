import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';

class RecordListHeader extends StatefulWidget {
  final List<String> dropdownList;

  const RecordListHeader({
    Key? key,
    this.dropdownList = const [
      '전체 기간',
      '2022년 04월',
      '2022년 05월',
      '2022년 07월',
      '2022년 08월',
      '2022년 09월',
      '2022년 10월',
      '2022년 11월',
    ],
  }) : super(key: key);

  @override
  State<RecordListHeader> createState() => _RecordListHeaderState();
}

class _RecordListHeaderState extends State<RecordListHeader> {
  String dropdownValue = '전체 기간';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '나의 행복기록',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Spacer(),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    style: Theme.of(context).textTheme.caption,
                    alignment: AlignmentDirectional.centerEnd,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    selectedItemBuilder: (context) {
                      return widget.dropdownList
                          .map(
                            (value) => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(value),
                              ],
                            ),
                          )
                          .toList();
                    },
                    items: widget.dropdownList.map((value) {
                      final int idx = widget.dropdownList.indexOf(value);

                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: idx + 1 == widget.dropdownList.length
                                    ? Colors.transparent
                                    : Color(0xFFEEEEEE),
                                width: 1,
                              ),
                            ),
                          ), //
                          child: Center(
                            child: Text(
                              value,
                              style: dropdownValue == value
                                  ? TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: purple,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
