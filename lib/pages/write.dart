import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/appbar.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:vrouter/vrouter.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  DateTime nowDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy.MM.dd', 'ko').format(nowDate);
    String formattedWeek = DateFormat('(E)', 'ko').format(nowDate);

    return Scaffold(
      appBar: Appbar(
        appBar: AppBar(),
        text: "행복기록",
        leadingIconButton: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: black,
          ),
          onPressed: context.vRouter.historyBack,
        ),
        actionTextButton: TextButton(
          onPressed: () => {},
          child: Text(
            '등록',
            style: TextStyle(color: black),
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
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Poppins',
                                color: black,
                              ),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              formattedWeek,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: black,
                                wordSpacing: -0.05,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('비'),
                            Text('흐림'),
                            Text('맑음'),
                            Text('행복'),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '당신만이 누리고 있는 행복을 붙잡아 기록해보세요.'),
                        maxLength: 400,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                      ),
                    ),
                    Text('#태그입력')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 83,
        color: purple,
        child: InkWell(
          onTap: () => {},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 23.0),
            child: Center(
              child: Text(
                '행복 업로드',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
