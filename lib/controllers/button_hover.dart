import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonhoverProvider = StateNotifierProvider<Hover, bool>((ref) {
  return Hover();
});

class Hover extends StateNotifier<bool> {
  Hover() : super(false);
  void hovered(value) => state=value;
}