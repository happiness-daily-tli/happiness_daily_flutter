import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';

class RecordListHeader extends StatefulWidget {
  final List<String> dropdownList;

  const RecordListHeader({
    Key? key,
    this.dropdownList = const [
      '실시간 인기순',
      '최신순',
      '댓글 많은순',
    ],
  }) : super(key: key);

  @override
  State<RecordListHeader> createState() => _RecordListHeaderState();
}

class _RecordListHeaderState extends State<RecordListHeader> {
  String dropdownValue = '실시간 인기순';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
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
