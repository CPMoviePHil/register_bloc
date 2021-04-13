class Utils {

  static final List<String> _list = ['mr', 'Anderson', 'is', 'a' ,'fucker', 'no', 'body', 'can', 'fuck', 'him', 'besides', 'mr', 'anderson', 'himself', 'jesus', 'someday', 'will', 'die', 'again'];
  static Stream<String> timer({
    int times,
  }) {
    return Stream<String>.periodic(
      Duration(
        milliseconds: 50,
      ), (int x) => '$x',
    ).take(
      times,
    );
  }

  static Stream<String> createFromIterable() {
    return Stream.fromIterable(_list);
  }

  static Utils _utils = Utils._internal();

  Utils._internal();

  factory Utils() => _utils;
}