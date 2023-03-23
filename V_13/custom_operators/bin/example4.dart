void main(List<String> args) {
  print('Foo Bar' - 'Bar');
}

extension Remove on String {
  String operator -(String other) {
    return replaceAll(other, '');
  }
}
