void main(List<String> args) {
  print([1, 2, 3] - [4]);
}

extension Remove<T> on Iterable<T> {
  Iterable<T> operator -(Iterable<T> other) {
    return where((element) => !other.contains(element));
  }
}
