void main(List<String> args) {
  print([1, 2, 3, 4].containsDuplicateValues);
  print(["em", "em", "meo"].containsDuplicateValues);
}

extension ContainsDup<T> on Iterable<T> {
  bool get containsDuplicateValues => toSet().length != length;
}
