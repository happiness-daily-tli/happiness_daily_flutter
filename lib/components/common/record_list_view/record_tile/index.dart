import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'content.dart';
import 'date.dart';
import 'edit_button.dart';
import 'header.dart';
import 'slider.dart';
import 'hashtag.dart';
import 'status.dart';
import 'weather.dart';

class RecordTile extends StatefulWidget {
  final Record record;

  const RecordTile({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  State<RecordTile> createState() => _RecordTileState();
}

class _RecordTileState extends State<RecordTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecordTileHeader(user: widget.record.user),
        SizedBox(
          height: 10,
        ),
        RecordTileSlider(imageUrl: widget.record.imageUrl),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecordTileStatus(
              isLock: widget.record.isLock,
              isHeart: widget.record.isHeart,
              heartCount: widget.record.heartCount,
              commentLength: widget.record.comment.length,
            ),
            RecordTileEditButton(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        RecordTileWeather(weather: widget.record.weather),
        SizedBox(
          height: 10,
        ),
        RecordTileContent(content: widget.record.content),
        SizedBox(
          height: 10,
        ),
        RecordTileHashtag(hashtag: widget.record.hashtag),
        SizedBox(
          height: 10,
        ),
        RecordTileDate(date: widget.record.date),
      ],
    );
  }
}
