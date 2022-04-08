import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/alert_dialog_widget.dart';
import 'package:happiness_daily_flutter/constants/index.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:image_picker/image_picker.dart';

class SelectPicture extends StatefulWidget {
  @override
  State<SelectPicture> createState() => _SelectPictureState();
}

class _SelectPictureState extends State<SelectPicture> {
  final ImagePicker _picker = ImagePicker();
  List<String> images = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImg(bool isCamera) async {
    final XFile? image = await _picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        images.add(image.path);
      });
    }

    Navigator.pop(context);
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
                TextButton(
                  onPressed: () => _pickImg(false),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '갤러리',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: black,
                          ),
                        ),
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
                TextButton(
                  onPressed: () => _pickImg(true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '카메라',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: black,
                          ),
                        ),
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

    return Row(
      children: [
        Row(
          children: images.map(
            (image) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(image),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Image.asset(
                          'assets/images/common/icon/cross.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
        GestureDetector(
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
        ),
      ],
    );
  }
}
