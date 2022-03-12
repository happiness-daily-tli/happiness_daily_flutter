import 'package:flutter/material.dart';

import 'bottom_button_widget.dart';

class BottomButtonConfirmWidget extends StatelessWidget {
  final Function onClickConfirm;
  final Function onClickCancel;

  const BottomButtonConfirmWidget({
    Key? key,
    required this.onClickConfirm,
    required this.onClickCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          BottomButtonWidget(
            disabledThemeOnly: true,
            onClick: onClickCancel,
            labelText: '취소',
          ),
          SizedBox(
            width: 10,
          ),
          BottomButtonWidget(
            onClick: onClickConfirm,
            labelText: '확인',
          ),
        ],
      ),
    );
  }
}
