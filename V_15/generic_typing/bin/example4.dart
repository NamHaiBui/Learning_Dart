void main(List<String> arguments) {
  final bla = KeyValue('Hello', 1);
  print(bla);
}

//MapEntry: a single Entry of Map
typedef KeyValue<K, V> = MapEntry<K, V>;
// The generic types above are unconstrained
