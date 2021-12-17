import 'package:hooks_riverpod/hooks_riverpod.dart';

final userNameProvider = StateProvider<String>((ref) => '');
final userIconProvider = StateProvider<String>(
    (ref) => 'assets/images/common/user/icon_large_0.png');
final tabIndexProvider = StateProvider<int>((ref) => 0);
