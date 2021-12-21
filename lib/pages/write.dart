import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class WritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('행복기록'),
        leading: context.vRouter.historyCanBack()
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: context.vRouter.historyBack)
            : null,
      ),
      body: Center(
        child: Text('Write Page'),
      ),
    );
  }
}
