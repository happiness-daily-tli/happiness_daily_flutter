import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';

class RecordTileReportButton extends StatelessWidget {
  final List<Map<String, dynamic>> dropdownList;

  const RecordTileReportButton({
    Key? key,
    this.dropdownList = const [
      {'value': 'report', 'text': '신고'},
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 60,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          onChanged: (value) => {},
          icon: Image.asset(
            'assets/images/common/icon/more.png',
            width: 20,
            height: 20,
          ),
          items: dropdownList.map((items) {
            final int idx = dropdownList.indexOf(items);

            return DropdownMenuItem(
              value: items['value'],
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: idx + 1 == dropdownList.length
                          ? Colors.transparent
                          : Color(0xFFEEEEEE),
                      width: 1,
                    ),
                  ),
                ), //
                child: Center(
                  child: Text(
                    items['text'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: purple,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
