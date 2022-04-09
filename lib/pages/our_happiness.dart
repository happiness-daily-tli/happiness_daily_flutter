import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/appbar_widget.dart';
import 'package:happiness_daily_flutter/components/our_happiness/index.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurHappinessPage extends ConsumerStatefulWidget {
  final Function handleDrawer;

  const OurHappinessPage({
    Key? key,
    required this.handleDrawer,
  }) : super(key: key);

  @override
  _OurHappinessPageState createState() => _OurHappinessPageState();
}

class _OurHappinessPageState extends ConsumerState<OurHappinessPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    ref.read(recordProvider);
    ;
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

    return Scaffold(
      backgroundColor: gray,
      appBar: AppbarWidget(
        appBar: AppBar(),
        text: "우리의 행복",
        backgroundColor:
            _scrollPosition > 100 ? Colors.white : Colors.transparent,
        leadingIconButton: Transform.scale(
          scale: 0.7,
          child: IconButton(
            icon: Image.asset('assets/images/common/icon/hamburger.png'),
            onPressed: () => widget.handleDrawer(),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        children: [
          RecordListHeader(),
          Center(
            child: record.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
              data: (record) {
                return RecordListView(recordList: record);
              },
            ),
          ),
        ],
      ),
    );
  }
}
