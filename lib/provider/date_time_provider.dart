import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateProvider((ref) {
  return "dd/mm/yy";
});



final timeProvider = StateProvider((ref) {
  return "hh : mm";
});