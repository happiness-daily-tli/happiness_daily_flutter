import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/record_list_view.dart';
import 'package:happiness_daily_flutter/components/my_happiness/index.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'package:happiness_daily_flutter/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHappinessPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Record>> record = ref.watch(recordProvider);

    return ListView(
      padding: EdgeInsets.zero,
      primary: true,
      children: [
        Stack(
          children: [
            Container(
              height: 620,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home/background.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: 171,
              right: 20,
              child: Top(),
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
              return RecordListView(recordList: record);
            },
          ),
        ),
      ],
    );
  }
}
