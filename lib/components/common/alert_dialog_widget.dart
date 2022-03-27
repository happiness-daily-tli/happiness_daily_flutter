import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button_confirm_widget.dart';
import 'package:happiness_daily_flutter/constants/index.dart';

import 'bottom_button_alert_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  final Widget contentWidget;
  final String headerText;
  final ButtomType bottomButtonType;
  final Function? onClick;
  final Function? onClickCancel;

  const AlertDialogWidget({
    Key? key,
    required this.contentWidget,
    this.headerText = '',
    this.bottomButtonType = ButtomType.alert,
    this.onClick,
    this.onClickCancel,
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
        child: contentWidget,
      ),
      actions: <Widget>[
        bottomButtonType == ButtomType.alert
            ? BottomButtonAlertWidget(
                onClick: onClick ?? () => Navigator.pop(context),
              )
            : BottomButtonConfirmWidget(
                onClickCancel: onClickCancel ?? () => Navigator.pop(context),
                onClick: onClick ?? () => Navigator.pop(context),
              )
      ],
    );
  }
}
