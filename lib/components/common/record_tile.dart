import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/record_tile_slider.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'package:happiness_daily_flutter/models/weather.dart';
import 'package:intl/intl.dart';

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
  final dropdownList = ['수정', '삭제'];

  @override
  Widget build(BuildContext context) {
    final dataFormat = new DateFormat('yyyy.MM.dd');
    final Weather weather = weatherList[
        weatherList.indexWhere((e) => e.name == widget.record.weather)];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                widget.record.user['iconUrl'],
                width: 32,
                height: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.record.user['name'],
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RecordTileSlider(
            imageUrl: widget.record.imageUrl,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 43,
                    child: Row(
                      children: [
                        Image.asset(
                          widget.record.isHeart
                              ? 'assets/images/common/icon/heart.png'
                              : 'assets/images/common/icon/heart_disabled.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(widget.record.heartCount.toString()),
                      ],
                    ),
                  ),
                  Container(
                    width: 43,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/common/icon/comment.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(widget.record.comment.length.toString()),
                      ],
                    ),
                  ),
                  Image.asset(
                    widget.record.isLock
                        ? 'assets/images/common/icon/lock.png'
                        : 'assets/images/common/icon/unlock.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              Container(
                height: 20,
                width: 60,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    onChanged: (String? value) {},
                    icon: Image.asset(
                      'assets/images/common/icon/more.png',
                      width: 20,
                      height: 20,
                    ),
                    items: dropdownList.map((String items) {
                      final int idx = dropdownList.indexOf(items);

                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: idx + 1 == dropdownList.length
                                    ? Colors.transparent
                                    : Color(0xFFEEEEEE),
                                width: 1,
                              ),
                            ),
                          ), //
                          child: Center(
                            child: Text(items),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Material(
              //   color: Colors.white,
              //   child: Container(
              //     width: 20,
              //     height: 20,
              //     child: IconButton(
              //       onPressed: () => print('here'),
              //       icon: Image.asset(
              //         'assets/images/common/icon/more.png',
              //         width: 20,
              //         height: 20,
              //       ),
              //       padding: EdgeInsets.zero,
              //       splashRadius: 10,
              //       splashColor: Theme.of(context).colorScheme.primary,
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                weather.imageUrl,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                weather.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.record.content),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 20,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: widget.record.hashtag.length,
              itemBuilder: (context, index) {
                return Text(
                  '#${widget.record.hashtag[index]}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 4);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dataFormat.format(DateTime.parse(widget.record.date)),
            style: TextStyle(
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}
