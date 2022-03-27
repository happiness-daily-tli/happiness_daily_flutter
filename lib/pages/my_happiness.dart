import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/appbar_widget.dart';
import 'package:happiness_daily_flutter/components/my_happiness/index.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHappinessPage extends ConsumerStatefulWidget {
  final Function handleDrawer;

  const MyHappinessPage({
    Key? key,
    required this.handleDrawer,
  }) : super(key: key);

  @override
  _MyHappinessPageState createState() => _MyHappinessPageState();
}

class _MyHappinessPageState extends ConsumerState<MyHappinessPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    ref.read(recordProvider);
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Record>> record = ref.watch(recordProvider);
    print(_scrollPosition);

    return Scaffold(
      appBar: AppbarWidget(
        appBar: AppBar(),
        text: _scrollPosition > 600 ? '나의 행복' : '',
        backgroundColor:
            _scrollPosition > 600 ? Colors.white : Colors.transparent,
        leadingIconButton: Transform.scale(
          scale: 0.7,
          child: IconButton(
            icon: Image.asset('assets/images/common/icon/hamburger.png'),
            onPressed: () => widget.handleDrawer(),
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
          controller: _scrollController,
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
