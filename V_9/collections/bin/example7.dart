import 'dart:collection';

void main(List<String> args) {
  final names = ['John', 'Jane'];
  names.add('Jack');
  // UnmodifiableListView will do as the name suggested
  try {
    final readOnlyList = UnmodifiableListView(names);
    readOnlyList.add('Jill');
  } catch (e) {
    print(e);
  }
}
