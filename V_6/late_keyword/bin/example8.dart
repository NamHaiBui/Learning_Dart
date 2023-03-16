void main(List<String> args) {
  print('late fullName is being initialized');
  late final fullName = getFullName();
  final resolvedFullname = fullName;
  print('resolvedFullName = $resolvedFullname');
}

String getFullName() {
  print('getFullName() is called');
  return 'John Doe';
}
