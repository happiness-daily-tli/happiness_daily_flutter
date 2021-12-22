import 'package:flutter/material.dart';

class RecordListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  width: 1,
                ),
                Image.asset('assets/images/common/icon/down.png',
                    width: 6, height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
