import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';

class BottomButton extends StatelessWidget {
  final Function onClick;
  final String labelText;
  final bool disabled;
  final bool disabledThemeOnly;

  const BottomButton({
    Key? key,
    required this.onClick,
    required this.labelText,
    this.disabled = false,
    this.disabledThemeOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: disabledThemeOnly
              ? ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: gray,
                  onPrimary: grayDark,
                )
              : null,
          onPressed: disabled ? null : () => this.onClick(),
          child: Text(this.labelText),
        ),
      ),
    );
  }
}
