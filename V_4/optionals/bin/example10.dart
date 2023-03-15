void main(List<String> args) {
  // Does not guarantee to return a string
  String? getFullNameOptional() {
    return 'FooBar';
  }

  String getFullName() {
    return 'FooBar';
  }

  final fullName = getFullNameOptional() ?? getFullName();
  print(fullName);
  final someName = getFullNameOptional();
  someName.describe();
}

extension Describe on Object? {
  void describe() {
    if (this == null) {
      print('This object is null');
    } else {
      print('$runtimeType: $this');
    }
  }
}
