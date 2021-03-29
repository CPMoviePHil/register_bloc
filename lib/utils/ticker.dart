class TimerStream{

  Stream<int> ticker(int seconds) {
    return Stream.periodic(Duration(seconds: 1), (x) => seconds -x -1).take(seconds);
  }

}