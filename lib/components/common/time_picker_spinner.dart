import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:happiness_daily_flutter/utils/time_picker_spinner.dart';

class TimePickerSpinnerWidget extends StatelessWidget {
  final Function setTime;

  const TimePickerSpinnerWidget({
    Key? key,
    required this.setTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 16, color: black),
      highlightedTextStyle: TextStyle(
        fontSize: 16,
        color: black,
        fontWeight: FontWeight.bold,
      ),
      spacing: 20,
      itemHeight: 30,
      minutesInterval: 5,
      isForce2Digits: true,
      onTimeChange: (time) => setTime(time),
    );
  }
}
