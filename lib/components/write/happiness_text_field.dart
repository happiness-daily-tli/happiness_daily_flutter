import 'package:flutter/material.dart';

class HappinessTextField extends StatelessWidget {
  const HappinessTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: '당신만이 누리고 있는 행복을 붙잡아 기록해보세요.'),
      maxLength: 400,
      minLines: null,
      maxLines: null,
      expands: true,
    );
  }
}
