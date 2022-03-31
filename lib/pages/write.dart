import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/appbar_widget.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:happiness_daily_flutter/models/weather.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:vrouter/vrouter.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  DateTime nowDate = DateTime.now();
  int selectedWeatherIndex = 0;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy.MM.dd', 'ko').format(nowDate);
    String formattedWeek = DateFormat('(E)', 'ko').format(nowDate);

    void _onChangeWeatherIndex(int index) {
      setState(() {
        selectedWeatherIndex = index;
      });
    }

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                formattedWeek,
                                style: TextStyle(
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < weatherList.length; i++)
                              GestureDetector(
                                onTap: () => _onChangeWeatherIndex(i),
                                child: Column(
                                  children: i == selectedWeatherIndex
                                      ? [
                                          Container(
                                            width: 34,
                                            height: 34,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF2F1FF),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                weatherList[i].imageUrl,
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            weatherList[i].name,
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                        ]
                                      : [
                                          Container(
                                            width: 34,
                                            height: 34,
                                            child: Center(
                                              child: Image.asset(
                                                weatherList[i].imageDisabledUrl,
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                ),
                              ),
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
    );
  }
}
