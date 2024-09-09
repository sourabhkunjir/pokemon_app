import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false);

  void changeTheme() {
    state = !state;
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, bool>(
  (ref) {
    return ThemeProvider();
  },
);
