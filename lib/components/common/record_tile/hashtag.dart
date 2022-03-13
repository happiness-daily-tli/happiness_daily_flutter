import 'package:flutter/material.dart';

class RecordTileHashtag extends StatelessWidget {
  final List<String> hashtag;

  const RecordTileHashtag({
    Key? key,
    required this.hashtag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: hashtag.length,
        itemBuilder: (context, index) {
          return Text(
            '#${hashtag[index]}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 4);
        },
      ),
    );
  }
}
