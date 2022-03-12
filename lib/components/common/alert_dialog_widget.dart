import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button_confirm_widget.dart';

import 'bottom_button_alert_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  final String headerText;
  final String contentText;

  const AlertDialogWidget({
    Key? key,
    this.headerText = '',
    this.contentText = '',
  }) : super(key: key);

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
          headerText,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      content: SingleChildScrollView(
        child: Center(
          child: Text(
            contentText,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
      actions: <Widget>[
        BottomButtonConfirmWidget(
          onClickCancel: () => Navigator.pop(context),
          onClickConfirm: () => Navigator.pop(context),
        ),
        BottomButtonAlertWidget(
          onClick: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
