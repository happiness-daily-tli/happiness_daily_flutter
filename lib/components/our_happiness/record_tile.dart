import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import '../common/record_tile/index.dart';

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
  void _onChangeIsHeart() {
    setState(() {
      widget.record.isHeart = !widget.record.isHeart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: RecordTileHeader(user: widget.record.user),
        ),
        SizedBox(
          height: 10,
        ),
        RecordTileSlider(imageUrl: widget.record.imageUrl),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecordTileStatus(
                    onChangeIsHeart: _onChangeIsHeart,
                    isHeart: widget.record.isHeart,
                    heartCount: widget.record.heartCount,
                    commentLength: widget.record.comment.length,
                  ),
                  RecordTileReportButton(),
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
          ),
        ),
      ],
    );
  }
}
