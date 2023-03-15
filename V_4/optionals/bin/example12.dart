void main(List<String> args) {
  //Flat Map: Is a function that allows you to drill down within a optiional and grab it value and map it to another value should that value is not null, else, you do nothing
  //
  String? firstName = 'John';
  String? lastName = 'Doe';

  final bla = firstName.flatMap(
        (f) => lastName.flatMap(
          (l) => '$f $l',
        ),
      ) ??
      'Either first or last name or both are null';
  print(bla);
}

extension FlatMap<T> on T? {
  R? flatMap<R>(
    R? Function(T) callback,
  ) {
    final shadow = this;
    if (shadow == null) {
      return null;
    } else {
      return callback(shadow);
    }
  }
}
