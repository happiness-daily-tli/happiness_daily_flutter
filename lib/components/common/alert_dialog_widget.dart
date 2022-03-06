import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.symmetric(vertical: 10),
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Center(
        child: Text(
          'Alert 공통 컴포넌트 헤더입니다.',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      content: SingleChildScrollView(
        child: Center(
          child: Text(
            'Alert 공통 컴포넌트 내용입니다.',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
      actions: <Widget>[
        BottomButtonWidget(
          onClick: () => Navigator.pop(context),
          labelText: '확인',
        ),
      ],
    );
  }
}
