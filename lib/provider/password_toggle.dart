import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleProvider = StateProvider<bool>((ref) => false);
final nameProvider = StateProvider<String>((ref) => "");
final animationProvider = StateProvider<bool>((ref) => false);
