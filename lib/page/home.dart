import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/state/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: Text('행복일기')),
      // TODO : Show List, Edit
      body: Text('${user.state}님 안녕하세요.'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {},
      ),
    );
  }
}
