class Ticker {
  const Ticker();

  Stream<int> tick(int ticks) {
    return Stream.periodic(
      Duration(seconds: 1),
      (periodicTickerCount) {
        return ticks - periodicTickerCount - 1;
      },
    ).take(ticks);
  }
}
