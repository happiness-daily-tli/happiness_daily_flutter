import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button_confirm_widget.dart';
import 'package:happiness_daily_flutter/constants/index.dart';

import 'bottom_button_alert_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  final Widget? contentWidget;
  final String headerText;
  final String headerSecondText;
  final ButtomType bottomButtonType;
  final Function? onClick;
  final Function? onClickCancel;

  const AlertDialogWidget({
    Key? key,
    this.contentWidget,
    this.headerText = '',
    this.headerSecondText = '',
    this.bottomButtonType = ButtomType.alert,
    this.onClick,
    this.onClickCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bottomButttonPadding = bottomButtonType == ButtomType.none ? 0 : 10;

    return AlertDialog(
      titlePadding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.symmetric(
        vertical: bottomButttonPadding,
      ),
      buttonPadding: EdgeInsets.all(bottomButttonPadding),
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            headerText,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 5.0,
          ),
          if (headerSecondText != '')
            Text(
              headerSecondText,
              style: Theme.of(context).textTheme.headline4,
            ),
        ],
      ),
      content: SingleChildScrollView(
        child: contentWidget,
      ),
      actions: <Widget>[
        if (bottomButtonType == ButtomType.alert)
          BottomButtonAlertWidget(
            onClick: onClick ?? () => Navigator.pop(context),
          ),
        if (bottomButtonType == ButtomType.confirm)
          BottomButtonConfirmWidget(
            onClickCancel: onClickCancel ?? () => Navigator.pop(context),
            onClick: onClick ?? () => Navigator.pop(context),
          ),
      ],
    );
  }
}
