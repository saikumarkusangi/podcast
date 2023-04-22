import 'package:flutter_riverpod/flutter_riverpod.dart';

final hoverProvider = StateNotifierProvider<Hover, int>((ref) {
  return Hover();
});

class Hover extends StateNotifier<int> {
  Hover() : super(0);
  void hovered(value) => state=value;
}

final currentTabProvider = StateNotifierProvider<CurrentTab, int>((ref) {
  return CurrentTab();
});

class CurrentTab extends StateNotifier<int> {
  CurrentTab() : super(0);
  void tab(value) => state=value;
}