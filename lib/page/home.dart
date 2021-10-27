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
      body: new Stack(
        children: [
          Offstage(
            offstage: tabIndex.state != 0,
            child: TickerMode(
              enabled: tabIndex.state == 0,
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(height: 1500),
                    Image.asset("assets/home/background.png"),
                    Positioned(
                      top: 548,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: 1000,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20.0)),
                        ),
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
