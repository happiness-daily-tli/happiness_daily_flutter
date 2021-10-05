import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/component/common/Footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset("assets/home/background.png"),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST'),
            Text('TEST')
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
