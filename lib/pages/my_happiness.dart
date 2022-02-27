import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/appbar_widget.dart';
import 'package:happiness_daily_flutter/components/common/record_list_view/record_list_view.dart';
import 'package:happiness_daily_flutter/components/my_happiness/index.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHappinessPage extends ConsumerWidget {
  final Function handleDrawer;

  const MyHappinessPage({
    Key? key,
    required this.handleDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Record>> record = ref.watch(recordProvider);

    return Scaffold(
      appBar: AppbarWidget(
        appBar: AppBar(),
        text: "",
        leadingIconButton: Transform.scale(
          scale: 0.7,
          child: IconButton(
            icon: Image.asset('assets/images/common/icon/hamburger.png'),
            onPressed: () => handleDrawer(),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          primary: true,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 640,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home/background.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  child: Music(),
                ),
                Positioned(
                  top: 190,
                  right: 20,
                  child: SpeechBubble(),
                ),
                Positioned(
                  top: 438,
                  width: MediaQuery.of(context).size.width,
                  child: Level(),
                ),
                Positioned(
                  top: 528,
                  width: MediaQuery.of(context).size.width,
                  child: RecordListHeader(),
                ),
              ],
            ),
            Center(
              child: record.when(
                loading: () => const CircularProgressIndicator(),
                error: (err, stack) => Text('Error: $err'),
                data: (record) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RecordListView(recordList: record),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
