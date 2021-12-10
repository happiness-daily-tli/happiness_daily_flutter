import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/record_tile_slider.dart';
import 'package:happiness_daily_flutter/models/record.dart';

class RecordTile extends StatelessWidget {
  final Record record;

  const RecordTile({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                record.user['iconUrl'],
                width: 32,
                height: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                record.user['name'],
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RecordTileSlider(
            imageUrl: record.imageUrl,
          )
        ],
      ),
    );
  }
}
