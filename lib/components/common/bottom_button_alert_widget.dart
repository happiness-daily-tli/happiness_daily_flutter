import 'package:flutter/material.dart';

import 'bottom_button_widget.dart';

class BottomButtonAlertWidget extends StatelessWidget {
  final Function onClick;
  final String labelText;
  final bool disabled;
  final bool disabledThemeOnly;

  const BottomButtonAlertWidget({
    Key? key,
    required this.onClick,
    this.labelText = '확인',
    this.disabled = false,
    this.disabledThemeOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          BottomButtonWidget(
            onClick: onClick,
            labelText: labelText,
            disabled: disabled,
            disabledThemeOnly: disabledThemeOnly,
          ),
        ],
      ),
    );
  }
}
