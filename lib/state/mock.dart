import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:happiness_daily_flutter/models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recordProvider = FutureProvider<List<Record>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 1000));

  final content = json.decode(
    await rootBundle.loadString('assets/mock/record/record.json'),
  ) as Map<String, dynamic>;

  if (content['data'] != null) {
    final data = <Record>[];
    content['data'].forEach((v) {
      data.add(Record.fromJson(v));
    });
    return data;
  } else {
    return [];
  }
});
