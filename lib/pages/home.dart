import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/footer.dart';
import 'package:happiness_daily_flutter/components/home/index.dart';
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
              child: MyHappiness(),
            ),
          ),
          Offstage(
            offstage: tabIndex.state != 1,
            child: TickerMode(
              enabled: tabIndex.state == 1,
              child: OurHappiness(),
            ),
          ),
          Offstage(
            offstage: tabIndex.state != 2,
            child: TickerMode(
              enabled: tabIndex.state == 2,
              child: FindingHappiness(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
