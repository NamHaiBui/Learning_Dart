void main(List<String> args) async {
  // Stream<>.reduce returns a Future
  final sum = await getAllAges().reduce((a, b) => a + b);
  print(sum);
}

Stream<int> getAllAges() async* {
  for (var i = 1; i <= 5; i++) {
    yield i * 10;
  }
}
