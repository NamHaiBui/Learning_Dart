void main(List<String> args) async {
  // Return a future<String> hence, you will have to have a way to consume it
  print(await getUserName());
  print(await getAddress());
  print(await getPhoneNumber());
  print(await getCity());
  print(await getZipCode());
}

Future<String> getUserName() async {
  return "John Doe";
}

Future<String> getAddress() {
  return Future.value('28North');
}

Future<String> getPhoneNumber() => Future.delayed(
      const Duration(seconds: 1),
      () => '717-',
    );
Future<String> getCity() async {
  /// Future is just a class, in order to kick-start a future and grab the final value of the future you need to use await
  await Future.delayed(const Duration(seconds: 1));
  return 'New York';
}

/// If you want to return a Future.value() instance, you would either have to wrap the result in an Future.value(),
/// or have the async keyword on the function
Future<String> getCountry1() async => 'India';
Future<String> getCountry2() => Future.value('India');

/// Marking the following function with async does not contribute to anything
Future<String> getZipCode() /* async */ =>
    Future.delayed(const Duration(seconds: 1), () => '12345');
