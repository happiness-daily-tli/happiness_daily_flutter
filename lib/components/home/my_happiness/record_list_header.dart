import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecordListHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '나의 행복기록',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Spacer(),
                Text(
                  '2021.07',
                  style: Theme.of(context).textTheme.caption,
                ),
                SvgPicture.asset('assets/images/home/more.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
