void main(List<String> args) {}
// mix in to other class :O
mixin HasHeight<H extends num> {
  H get height;
}

typedef HasIntHeight = HasHeight<int>;
typedef HasDoubleHeight = HasHeight<double>;

class Person with HasDoubleHeight {
  @override
  final double height;
  const Person({required this.height});
}

class Dog with HasIntHeight {
  @override
  final int height;
  const Dog({required this.height});
}
