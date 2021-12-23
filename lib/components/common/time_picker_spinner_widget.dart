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
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 0.5,
                  color: grayDark,
                ),
              ),
            ),
          ),
        ),
        TimePickerSpinner(
          is24HourMode: false,
          normalTextStyle: TextStyle(
            fontSize: 16,
            color: black,
            fontFamily: 'Poppins',
          ),
          highlightedTextStyle: TextStyle(
            fontSize: 16,
            color: black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          normalApTextStyle: TextStyle(
            fontSize: 16,
            color: black,
            height: 1.1,
          ),
          highlightedApTextStyle: TextStyle(
            fontSize: 16,
            color: black,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
          itemWidth: 30,
          itemHeight: 30,
          spacing: 20,
          minutesInterval: 5,
          isForce2Digits: true,
          alignment: Alignment.center,
          onTimeChange: (time) => setTime(time),
        ),
      ],
    );
  }
}
