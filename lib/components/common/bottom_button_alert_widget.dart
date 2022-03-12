import 'package:flutter/material.dart';

import 'bottom_button_widget.dart';

class BottomButtonAlertWidget extends StatelessWidget {
  final Function onClick;

  const BottomButtonAlertWidget({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          BottomButtonWidget(
            onClick: onClick,
            labelText: '확인',
          ),
        ],
      ),
    );
  }
}
