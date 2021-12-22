import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button.dart';
import 'package:happiness_daily_flutter/components/common/time_picker_spinner.dart';
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

    _setAlert() async {
      _goToMyHappiness();
    }

    _setTime(time) async {
      print(time);
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          TimePickerSpinnerWidget(setTime: _setTime),
          BottomButton(
            onClick: _setAlert,
            labelText: '행복일기 시작하기',
          ),
          SizedBox(
            height: 10,
          ),
          BottomButton(
            onClick: _goToMyHappiness,
            disabledThemeOnly: true,
            labelText: '나중에 할게요',
          ),
        ],
      ),
    );
  }
}
