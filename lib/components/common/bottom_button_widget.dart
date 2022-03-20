import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';

// Use Only BottomButtonAlertWidget, BottomButtonConfirmWidget
class BottomButtonWidget extends StatelessWidget {
  final Function onClick;
  final String labelText;
  final bool disabled;
  final bool disabledThemeOnly;

  const BottomButtonWidget({
    Key? key,
    required this.onClick,
    required this.labelText,
    this.disabled = false,
    this.disabledThemeOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        child: ElevatedButton(
          style: disabledThemeOnly
              ? ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: gray,
                  onPrimary: darkGray,
                )
              : null,
          onPressed: disabled ? null : () => this.onClick(),
          child: Text(this.labelText),
        ),
      ),
    );
  }
}
