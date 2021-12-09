import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:happiness_daily_flutter/state/app.dart';
import 'package:vrouter/vrouter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends ConsumerWidget {
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    _setUserName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', user.state);
      context.vRouter.to('/');
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment(-1, -1),
                  end: Alignment(-1, 1),
                  colors: [Color(0xFFC4DBF6), Color(0xFFFACAFC)],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12.0,
                  child: Icon(
                    Icons.edit,
                    size: 15.0,
                    color: Color(0xFF404040),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 52,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20),
                    child: Text(
                      '닉네임',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '닉네임을 입력해주세요',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff999999),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      onChanged: (text) {
                        user.state = text;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Icons.announcement_outlined,
                        size: 18,
                        color: Color(0xFF6B53FF),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '이미 존재하는 닉네임입니다.',
                        style: TextStyle(
                          color: Color(0xFF6B53FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: user.state != '',
            ),
            InkWell(
              onTap: () => _setUserName(),
              child: Container(
                height: 52,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xFF6B53FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    '행복일기 시작하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
