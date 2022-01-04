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
