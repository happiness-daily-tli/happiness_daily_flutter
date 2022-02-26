import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/appbar_widget.dart';
import 'package:happiness_daily_flutter/components/common/record_list_view/index.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurHappinessPage extends ConsumerWidget {
  final Function handleDrawer;

  const OurHappinessPage({
    Key? key,
    required this.handleDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Record>> record = ref.watch(recordProvider);

    return Scaffold(
      appBar: AppbarWidget(
        appBar: AppBar(),
        text: "우리의 행복",
        leadingIconButton: Transform.scale(
          scale: 0.7,
          child: IconButton(
            icon: Image.asset('assets/images/common/icon/hamburger.png'),
            onPressed: () => handleDrawer(),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          primary: true,
          children: [
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
      ),
    );
  }
}
