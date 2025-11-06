import 'package:flutter_riverpod/flutter_riverpod.dart';

final appTitleProvider = Provider<String>((ref) {
  return 'State Management Fundamental menggunakan Riverpod';
});

final homeScreenTitleProvider = Provider<String>((ref) {
  return 'State Management Fundamental';
});
