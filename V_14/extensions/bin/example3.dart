void main(List<String> args) {
  print(1.to(10));
  print(1.to(-1, inclusive: true));
  print(1.to(10, inclusive: true));
}

extension on int {
  Iterable<int> to(int end, {bool inclusive = false}) {
    if (end > this) {
      return [for (var i = this; i < end; i++) i, if (inclusive) end];
    } else {
      return [for (var i = this; i > end; i--) i, if (inclusive) end];
    }
  }
}
