import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingAlertPage extends ConsumerStatefulWidget {
  const SettingAlertPage({Key? key}) : super(key: key);

  @override
  _SettingAlertPageState createState() => _SettingAlertPageState();
}

class _SettingAlertPageState extends ConsumerState<SettingAlertPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('setting_alert'),
    );
  }
}
