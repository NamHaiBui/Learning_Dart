void main(List<String> args) {
  const tuple = Tuple(1, 20);
  print(tuple);
  final swapped = tuple.swap();
  print(swapped);
}

class Tuple<L, R> {
  final L left;
  final R right;
  const Tuple(this.left, this.right);
  @override
  String toString() {
    return 'Tuple (left: $left, right: $right)';
  }
}

extension Swap<L, R> on Tuple<L, R> {
  Tuple<R, L> swap() => Tuple(right, left);
}

extension sumOnNum<L extends num, R extends num> on Tuple<L, R> {
  num get sum => left + right;
}
