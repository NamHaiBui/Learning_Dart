void main(List<String> args) {
  final String? firstName = null;
  // You can promote a type to not nullable
  if (firstName == null) {
    print('firstName was null');
  } else {
    final length = firstName?.length;
    print(length);
  }
}
