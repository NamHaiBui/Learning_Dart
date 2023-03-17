void main(List<String> args) {
  const info = {
    'name': 'John',
    'age': 30,
    'isMarried': false,
    'address': {
      'street': 'Main Street',
      'city': 'new York',
      'country': 'USA',
    },
  };
  // For loop over Map
  for (final entry in info.entries) {
    print('${entry.key}: ${entry.value}');
  }
}
