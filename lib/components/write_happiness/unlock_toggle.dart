import 'package:flutter/material.dart';

class UnlockToggle extends StatefulWidget {
  const UnlockToggle({
    Key? key,
  }) : super(key: key);

  @override
  State<UnlockToggle> createState() => _UnlockToggleState();
}

class _UnlockToggleState extends State<UnlockToggle> {
  bool isUnlock = false;

  void _onChangeIsUnlock() {
    setState(() {
      isUnlock = !isUnlock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onChangeIsUnlock(),
      child: Image.asset(
        isUnlock
            ? 'assets/images/common/icon/lock_toggle_unlock.png'
            : 'assets/images/common/icon/lock_toggle.png',
        height: 37,
        width: 70,
      ),
    );
  }
}
