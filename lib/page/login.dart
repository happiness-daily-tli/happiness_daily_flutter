import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

class LoginPage extends StatefulWidget {
  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<LoginPage> {
  _login() async {
    try {
      final installed = await isKakaoTalkInstalled();
      print('kakao Install : ' + installed.toString());
      installed
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      // perform actions after login
      Navigator.pushNamed(context, '/');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('로그인'),
        ),
        body: Center(
            child: InkWell(
          onTap: () => _login(),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble, color: Colors.black54),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '카카오계정 로그인',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ],
              )),
        )));
  }
}
