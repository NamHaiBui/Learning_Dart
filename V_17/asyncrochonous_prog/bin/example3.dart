void main(List<String> args) async {
  // final length = await calculateLenght(await getFullName());
  // you can return a Future type instance from a then
  final bla = await getFullName().then((value) => calculateLenght(value));
  print(bla);
}

/// Future Chaining is the possibility of feeding a Future into a Future to complete its work
Future<int> calculateLenght(String value) => Future.delayed(
      const Duration(seconds: 1),
      () => value.length,
    );
Future<String> getFullName() => Future.delayed(
      const Duration(seconds: 1),
      () => "John Doe",
    );
