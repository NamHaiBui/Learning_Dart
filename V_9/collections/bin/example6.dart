void main(List<String> args) {
  const names = ['John', 'Jane', 'Jack', 'Jill'];
  // Map function changed list to iterable to conserve storage
  final upperCaseNames = names.map((name) {
    print('Map got called');
    return name.toUpperCase();
  });
  for (final name in upperCaseNames.take(3)) {
    print(name);
  }
}
