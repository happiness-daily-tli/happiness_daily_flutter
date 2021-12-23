import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button.dart';
import 'package:happiness_daily_flutter/components/common/time_picker_spinner_widget.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

class SettingAlertPage extends ConsumerStatefulWidget {
  const SettingAlertPage({Key? key}) : super(key: key);

  @override
  _SettingAlertPageState createState() => _SettingAlertPageState();
}

class _SettingAlertPageState extends ConsumerState<SettingAlertPage> {
  @override
  Widget build(BuildContext context) {
    _goToMyHappiness() {
      context.vRouter.to('/');
    }

    _openPermissionDialog() {
      return showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AlertDialog(
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Center(
              child: Text(
                '행복일기 앱 사용권한 안내',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('카메라 필수'),
                  Text('행복찾기의 카메라 촬영시 사용'),
                  Text('갤러리 필수'),
                  Text('행복찾기의 사진 첨부시 사용'),
                  Text('접근권한 변경방법'),
                  Text('휴대폰 설정 > 앱 > 행복일기'),
                ],
              ),
            ),
            actions: <Widget>[
              BottomButton(
                onClick: _goToMyHappiness,
                labelText: '확인',
              ),
            ],
          );
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
      body: Padding(
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
      ),
    );
  }
}
