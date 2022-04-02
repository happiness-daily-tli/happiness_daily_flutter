import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class NowDate extends StatefulWidget {
  const NowDate({
    Key? key,
  }) : super(key: key);

  @override
  State<NowDate> createState() => _NowDateState();
}

class _NowDateState extends State<NowDate> {
  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    DateTime nowDate = DateTime.now();

    String formattedDate = DateFormat('yyyy.MM.dd', 'ko').format(nowDate);
    String formattedWeek = DateFormat('(E)', 'ko').format(nowDate);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formattedDate,
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(width: 4.0),
        Text(
          formattedWeek,
          style: TextStyle(
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
