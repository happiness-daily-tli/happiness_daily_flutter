import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/alert_dialog_widget.dart';
import 'package:happiness_daily_flutter/constants/index.dart';

class SelectPicture extends StatefulWidget {
  @override
  State<SelectPicture> createState() => _SelectPictureState();
}

class _SelectPictureState extends State<SelectPicture> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _openSelectPictureTypeDialog() {
      return showGeneralDialog(
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AlertDialogWidget(
            bottomButtonType: ButtomType.none,
            headerText: '사진을 선택해주세요.',
            contentWidget: Column(
              children: [
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('갤러리'),
                        Image.asset(
                          'assets/images/common/icon/gallery.png',
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('카메라'),
                        Image.asset(
                          'assets/images/common/icon/camera.png',
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () => _openSelectPictureTypeDialog(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/common/icon/camera.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
