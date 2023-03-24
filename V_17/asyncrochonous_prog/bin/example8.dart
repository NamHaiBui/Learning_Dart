void main(List<String> args) async {
  await for (final name in allnames()) {
    print(name);
  }
}

Stream<String> maleNames() async* {
  yield "Mark";
  yield "Shawn";
}

Stream<String> femaleNames() async* {
  yield "Linda";
  yield "Minda";
}

Stream<String> allnames() async* {
  // await for(final maleName  in maleNames()){
  //   yield maleName;
  // }
  // await for(final femaleName  in femaleNames()){
  //   yield femaleName;
  // }
  yield* maleNames();
  yield* femaleNames();
}
