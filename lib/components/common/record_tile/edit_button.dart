import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/alert_dialog_widget.dart';
import 'package:happiness_daily_flutter/constants/index.dart';

class RecordTileEditButton extends StatelessWidget {
  final List<Map<String, dynamic>> dropdownList;

  const RecordTileEditButton({
    Key? key,
    this.dropdownList = const [
      {'value': 'edit', 'text': '수정'},
      {'value': 'delete', 'text': '삭제'}
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _openDeleteDialog() {
      return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AlertDialogWidget(
            bottomButtonType: ButtomType.confirm,
            headerText: '나의 행복기록을 삭제하시겠어요?',
            content: Center(
              child: Text(
                '삭제 후 데이터는 복구되지 않습니다.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          );
        },
      );
    }

    return Container(
      height: 20,
      width: 60,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          onChanged: (value) {
            if (value != 'edit') _openDeleteDialog();
          },
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
                  child: Text(items['text']),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
    // Material(
    //   color: Colors.white,
    //   child: Container(
    //     width: 20,
    //     height: 20,
    //     child: IconButton(
    //       onPressed: () => print('here'),
    //       icon: Image.asset(
    //         'assets/images/common/icon/more.png',
    //         width: 20,
    //         height: 20,
    //       ),
    //       padding: EdgeInsets.zero,
    //       splashRadius: 10,
    //       splashColor: Theme.of(context).colorScheme.primary,
    //     ),
    //   ),
    // );
  }
}
