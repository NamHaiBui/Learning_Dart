void main(List<String> args) {
  final info = {
    'name': 'Foo',
    'age': 10,
  };
  print(info);
  print(info['name']);
  print(info['age']);

  print(info.keys);
  print(info.values);

  info.putIfAbsent('height', () => 190);
  // This work even if hieght did not exist. Similar to default dictionary in python

  info['height'] = 190;

  for (final entry in info.entries) {
    print(entry.key);
    print(entry.value);
  }
  if (info.containsKey('height')) {
    print('Hieght is ${info['height']}');
  }
  // All non-existent keys' values are null
  print(info['weight']);
}
