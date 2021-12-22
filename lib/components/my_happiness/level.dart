import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 76,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text.rich(
                  TextSpan(
                    text: '나의 행복지수',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Lv.1',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SvgPicture.asset('assets/images/home/flag.svg'),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 24,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: 0.2,
                    color: Color(0xFF6B53FF),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2개',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .apply(color: Colors.white),
                    ),
                    Text(
                      '10개',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
