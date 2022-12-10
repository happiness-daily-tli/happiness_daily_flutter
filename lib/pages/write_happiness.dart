import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/alert_dialog_widget.dart';
import 'package:happiness_daily_flutter/components/common/appbar_widget.dart';
import 'package:happiness_daily_flutter/components/write_happiness/index.dart';
import 'package:happiness_daily_flutter/constants/index.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:vrouter/vrouter.dart';

class WriteHappinessPage extends StatefulWidget {
  @override
  State<WriteHappinessPage> createState() => _WriteHappinessPageState();
}

class _WriteHappinessPageState extends State<WriteHappinessPage> {
  _openLevelupDialog() {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialogWidget(
          bottomButtonType: ButtomType.alert,
          headerText: '행복 레벨업을 축하해요!',
          onClick: context.vRouter.historyBack,
        );
      },
    );
  }

  _saveExp() {
    Navigator.pop(context);
    _openLevelupDialog();
  }

  _openSaveCompleteDialog(int number) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialogWidget(
          bottomButtonType: ButtomType.alert,
          headerText: '$number번째 행복일기를',
          headerSecondText: '저장했습니다.',
          onClick: _saveExp,
        );
      },
    );
  }

  _openErrorDialog(String message) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialogWidget(
          bottomButtonType: ButtomType.alert,
          headerText: message,
          onClick: _openLevelupDialog,
        );
      },
    );
  }

  _saveHappiness() {
    _openSaveCompleteDialog(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        appBar: AppBar(),
        text: "행복기록",
        leadingIconButton: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: black,
          ),
          onPressed: context.vRouter.historyBack,
        ),
        actionTextButton: GestureDetector(
          onTap: () => _saveHappiness(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: Text(
                '등록',
                style: TextStyle(color: black),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home/background.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: CurrentDate(),
                        ),
                        SelectWeather(),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    SelectPicture(),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: HappinessTextField(),
                    ),
                    SizedBox(height: 20.0),
                    SelectTag(),
                    SizedBox(height: 20.0),
                    UnlockToggle(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
