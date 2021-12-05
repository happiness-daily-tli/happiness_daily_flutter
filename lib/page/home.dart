import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happiness_daily_flutter/component/common/Footer.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: tabIndex.state != 0,
            child: TickerMode(
              enabled: tabIndex.state == 0,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 1000,
                      alignment: Alignment.topCenter,
                      child: Image.asset("assets/home/background.png"),
                    ),
                    Positioned(
                      top: 171,
                      right: 20,
                      child: Container(
                        width: 150,
                        height: 76,
                        padding: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 100,
                              offset: Offset(0, 3),
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/home/speech_bubble.png'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('행복하려고 마음 먹은 만큼'),
                            Text('행복해질 수 있어요.')
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 438,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        width: 150,
                        height: 76,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: '나의 행복지수',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Lv.1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6B53FF),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child:
                                      SvgPicture.asset('assets/home/flag.svg'),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 24,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.4622,
                                      color: Color(0xFF6B53FF),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 26, top: 6),
                                  child: Row(
                                    children: [
                                      Text(
                                        '2개',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '10개',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6B53FF),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 528,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: 1000,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 50, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '나의 행복기록',
                                    style: TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '2021.07',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SvgPicture.asset('assets/home/more.svg'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Offstage(
            offstage: tabIndex.state != 1,
            child: TickerMode(
              enabled: tabIndex.state == 1,
              child: Center(child: Text('1')),
            ),
          ),
          Offstage(
            offstage: tabIndex.state != 2,
            child: TickerMode(
              enabled: tabIndex.state == 2,
              child: Center(child: Text('2')),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
