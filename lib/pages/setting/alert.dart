import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button.dart';
import 'package:happiness_daily_flutter/components/common/time_picker_spinner_widget.dart';
import 'package:happiness_daily_flutter/components/setting/permission_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingAlertPage extends ConsumerStatefulWidget {
  const SettingAlertPage({Key? key}) : super(key: key);

  @override
  _SettingAlertPageState createState() => _SettingAlertPageState();
}

class _SettingAlertPageState extends ConsumerState<SettingAlertPage> {
  @override
  Widget build(BuildContext context) {
    _openPermissionDialog() {
      return showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return PermissionDialog();
        },
      );
    }

    _setAlert() async {
      _openPermissionDialog();
    }

    _setTime(time) async {
      print(time);
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  '유니콘님, 반가워요.',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  '행복해지고 싶은',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  '시간을 설정해 주세요.',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 30),
                TimePickerSpinnerWidget(setTime: _setTime),
                SizedBox(height: 30),
              ],
            ),
          ),
          BottomButton(
            onClick: _setAlert,
            labelText: '행복일기 시작하기',
          ),
          SizedBox(
            height: 10,
          ),
          BottomButton(
            onClick: _openPermissionDialog,
            disabledThemeOnly: true,
            labelText: '나중에 할게요',
          ),
        ],
      ),
    );
  }
}
