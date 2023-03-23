void main(List<String> args) {
  print({'name': 'John', 'age': 30} + {'address': 'Conway'});
  print({'name': 'John', 'age': 30} - {'age': '30'});
}

extension MapOperations<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) {
    return {
      ...this,
      ...other,
    };
  }

  Map<K, V> operator -(Map<K, V> other) {
    return {...this}..removeWhere((key, value) {
        return other.containsKey(key) && other[key] == value;
      });
  }

  Iterable<Map<K, V>> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield this;
    }
  }
}
