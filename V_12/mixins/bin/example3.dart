void main(List<String> args) {
  final whiskers = Cat(age: 2);
  print(whiskers.age);
  whiskers.incrementAge();
  print(whiskers.age);
}

mixin HasAge {
  /// This forces the class/enum that utilize the mixin
  /// to make a value that allow you to read and write in
  abstract int age;
  // while with `int get age` you can have the value with a final/const keyword of which you cannot make any changes to
  void incrementAge() => age++;
}

class Cat with HasAge {
  @override
  int age = 0;
  Cat({required this.age});
}
