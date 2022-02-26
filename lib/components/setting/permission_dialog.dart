import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button_widget.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:vrouter/vrouter.dart';

class PermissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _goToMyHappiness() {
      context.vRouter.to('/');
    }

    return AlertDialog(
      titlePadding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.symmetric(vertical: 10),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('카메라 ',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            '필수',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .apply(color: purple),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/common/icon/camera.png',
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '행복찾기의 카메라 촬영시 사용',
                    style: TextStyle(fontSize: 12, color: darkGray),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('갤러리 ',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            '필수',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .apply(color: purple),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/common/icon/gallery.png',
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '행복찾기의 사진 첨부시 사용',
                    style: TextStyle(fontSize: 12, color: darkGray),
                  ),
                ],
              ),
            ),
            Divider(thickness: 0.3, color: darkGray),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '접근권한 변경방법',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '휴대폰 설정 > 앱 > 행복일기',
                    style: TextStyle(fontSize: 12, color: darkGray),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        BottomButtonWidget(
          onClick: _goToMyHappiness,
          labelText: '확인',
        ),
      ],
    );
  }
}
