import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/happiness_theme.dart';
import 'package:vrouter/vrouter.dart';

class WritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '행복기록',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: context.vRouter.historyCanBack()
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: black,
                ),
                onPressed: context.vRouter.historyBack)
            : null,
        actions: [
          TextButton(
            onPressed: () => {},
            child: Text(
              '등록',
              style: TextStyle(color: black),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home/background.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('2021.07.09 (금)'),
                      ],
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '당신만이 누리고 있는 행복을 붙잡아 기록해보세요.'),
                        maxLength: 400,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                      ),
                    ),
                    Text('#태그입력')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 83,
        color: purple,
        child: InkWell(
          onTap: () => {},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 23.0),
            child: Center(
              child: Text(
                '행복 업로드',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
