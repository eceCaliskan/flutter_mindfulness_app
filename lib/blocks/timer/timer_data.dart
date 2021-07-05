//https://stackoverflow.com/questions/60377519/how-to-update-the-countdown-timer-repeatedly-in-flutter
// https://medium.com/flutter-community/flutter-timer-with-flutter-bloc-a464e8332ceb

class Tick {

  Stream<int> tick({int ticks}) { //periodically takes away 1 from the duration
    return Stream<int>.periodic(
        const Duration(seconds: 1), (x) => ticks - x % (ticks + 1));
  }
}




