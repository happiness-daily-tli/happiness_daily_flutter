import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateProvider<String>((ref) => '');
final tabIndexProvider = StateProvider<int>((ref) => 0);
