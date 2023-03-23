void main(List<String> args) {
  sort(ascending: true);
  sort(ascending: false);
}

const ages = [100, 20, 30, 40];
const names = ['Foo', 'Bar', 'Baz'];
const distances = [3.1, 3.2, 3.9, 3.2];
int isLessThan<T extends Comparable>(T a, T b) => a.compareTo(b);
int isGreaterThan<T extends Comparable>(T a, T b) => b.compareTo(a);

void sort({required bool ascending}) {
  final comparator = ascending ? isLessThan : isGreaterThan;
  print([...ages]..sort(comparator));
  print([...names]..sort(comparator));
  print([...distances]..sort(comparator));
}
