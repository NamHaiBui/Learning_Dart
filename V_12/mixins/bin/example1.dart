void main(List<String> args) {
  /// mixins are sepeareate enity that can bring functionality to existing classes and enumarations
  /// mixins allows you to create functions, functionality in the mixins and bring them in different classes or enumarations.
  /// That way you can have something somewhat like inheritance
  /// dart does not have multiple inheritance.
  ///
  final person = Person();
  person.jump(speed: 10);
  person.walk(speed: 5);
}

mixin HasSpeed {
  /// mixins when do abstract property is a contract
  /// whicch ever types (enum, class) that brings it in as a mixin has to have that property
  abstract double speed;
}
mixin CanJump on HasSpeed {
  void jump({
    required double speed,
  }) {
    print('$runtimeType is jumping at the speed of $speed');
    this.speed = speed;
  }
}
mixin CanWalk on HasSpeed {
  void walk({
    required double speed,
  }) {
    print('$runtimeType is walking at the speed of $speed');
    this.speed = speed;
  }
}

class Person with HasSpeed, CanWalk, CanJump {
  @override
  double speed;
  Person() : speed = 0.0;
}
