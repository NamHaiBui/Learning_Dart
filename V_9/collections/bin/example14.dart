import 'package:collection/collection.dart';

void main(List<String> args) {
  // testCanonicalizedMap();
  testCombinedIterableView();
}

void testBoolList() {
  final boolList = BoolList(10, growable: true);
  print(boolList);
  boolList[3] = true;
  if (boolList[3]) {
    print('The boolean value at index 3 is true');
  } else {
    print('The boolean value at index 3 is false');
  }
  print(boolList);
  boolList.length *= 2;
  print(boolList);
}

void testCanonicalizedMap() {
  /// Given a key, you can create a value that decide that whether two keys can coexist in the map
  ///
  final info = {
    'name': 'John',
    'age': 30,
    'sex': 'male',
    'address': 'New York'
  };
  final canonMap = CanonicalizedMap.from(
    info,
    (key) {
      return key.split('').first;
    },
  );
  print(canonMap);
}

void testCombinedIterableView() {
  final Iterable<int> one = [1, 2, 3];
  final Iterable<int> two = [10, 20, 30];
  final Iterable<int> three = [400, 500, 600];
  var combined = CombinedIterableView([one, two, three]);
  print(combined);
  print(combined);
}

void testCombinedListView() {
  final one = [1, 2, 3];
  final two = [10, 20, 30];
  final three = [400, 500, 600];
  final combined = CombinedListView([one, two, three]);
  print(combined);
  two.add(
      40); // combined is constantly updating with the changes made to its components
  print(combined);
}

void testMapMerging() {
  const info1 = {
    'name': 'John',
    'age': 30,
    'height': 1.8,
  };
  const info2 = {'name': 'John', 'age': 31, 'height': 1.8, 'weight': 80};
  final merge = mergeMaps(info1, info2, value: (one, two) => one);
  print(merge);
}
