import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final List<String> imgList = [
  "assets/login_0.png",
  "assets/login_1.png",
  "assets/login_2.png"
];

class LoginPage extends StatefulWidget {
  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<LoginPage> {
  // _login() async {
  //   try {
  //     final installed = await isKakaoTalkInstalled();
  //     print('kakao Install : ' + installed.toString());
  //     installed
  //         ? await UserApi.instance.loginWithKakaoTalk()
  //         : await UserApi.instance.loginWithKakaoAccount();
  //     // perform actions after login\
  //     context.vRouter.to('/home');
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  _login() async {
    try {
      final installed = await isKakaoTalkInstalled();
      print('kakao Install : ' + installed.toString());
      String authCode = installed
          ? await AuthCodeClient.instance.requestWithTalk()
          : await AuthCodeClient.instance.request();
      AccessTokenResponse token =
          await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
      // Store access token in AccessTokenStore for future API requests.
      context.vRouter.to('/');
    } catch (e) {
      // some error happened during the course of user login... deal with it.
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Builder(
            builder: (context) {
              final double height = MediaQuery.of(context).size.height;
              return CarouselSlider(
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
                items: imgList
                    .map(
                      (item) => Container(
                        child: Center(
                          child: Image(
                            height: height,
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: InkWell(
              onTap: () => kIsWeb
                  ? showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Web에서는 로그인을 할 수 없어요.'),
                        content: const Text('모바일을 이용해주세요!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('확인'),
                          ),
                        ],
                      ),
                    )
                  : _login(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/kakao.svg'),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '카카오 로그인',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
