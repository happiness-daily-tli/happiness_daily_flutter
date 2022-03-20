import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/bottom_button_alert_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:happiness_daily_flutter/state/app.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vrouter/vrouter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingUserPage extends ConsumerStatefulWidget {
  const SettingUserPage({Key? key}) : super(key: key);

  @override
  _SettingUserPageState createState() => _SettingUserPageState();
}

class _SettingUserPageState extends ConsumerState<SettingUserPage> {
  final userNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String iconUrl = 'assets/images/common/user/icon_large_0.png';
  bool isDuplication = true;
  bool isUserName = false;

  @override
  void initState() {
    super.initState();
    userNameController.addListener(_setIsUserName);
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  Future<void> _pickImg() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        iconUrl = image.path;
      });
    }
  }

  void _turnOffDuplication() {
    setState(() {
      isDuplication = false;
    });
  }

  void _setIsUserName() {
    setState(() {
      isUserName = userNameController.text != '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(userNameProvider);
    final userIcon = ref.watch(userIconProvider);

    _setUser() async {
      if (isDuplication) {
        _turnOffDuplication();
        return;
      }
      userName.state = userNameController.text;
      userIcon.state = iconUrl;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', userNameController.text);
      prefs.setString('usericon', iconUrl);
      context.vRouter.to('/setting/alert');
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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(iconUrl),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12.0,
                  child: ElevatedButton(
                    onPressed: () => _pickImg(),
                    child: Image.asset(
                      'assets/images/common/icon/pencil.png',
                      width: 14,
                      height: 14,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0),
                      primary: Colors.white,
                      onPrimary: Theme.of(context).colorScheme.primary,
                    ),
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
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Text(
                      '닉네임',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: '닉네임을 입력해주세요',
                        hintStyle: TextStyle(
                          color: Color(0xff999999),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: !isDuplication,
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Image.asset('assets/images/common/icon/notice.png',
                          width: 18, height: 18),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        '이미 존재하는 닉네임입니다.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButtonAlertWidget(
              onClick: _setUser,
              disabled: userNameController.text == '',
            ),
          ],
        ),
      ),
    );
  }
}
