///Returns the user to the clicked page using the stream methods according to the
///clicked page on BottomNavigation class
///@Ece caliskan
///2021

import 'dart:async';

enum NavBarItem { HOME, CHECKIN, MEDITATION, JOURNALING }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast(); //the stream listened more than once

  NavBarItem defaultItem = NavBarItem.HOME;//the landing page will be home

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void clickPage(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.CHECKIN);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.MEDITATION);
        break;
      case 3:
        _navBarController.sink.add(NavBarItem.JOURNALING);
        break;
    }
  }

  close() {
    _navBarController?.close();
  }
}
