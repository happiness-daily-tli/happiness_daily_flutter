import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';

class SelectTag extends StatelessWidget {
  const SelectTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '#태그입력',
      style: TextStyle(color: purple),
    );
  }
}
