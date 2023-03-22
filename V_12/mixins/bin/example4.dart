void main(List<String> args) {
  /// you can also limit mixin to a specific data type
  /// Like in example1, you cannot bring in CanJump without bringing in HasSpeed
}

class Has2Feet {
  const Has2Feet();
}

class Human extends Has2Feet with CanRun {
  const Human();
}

/// What this is saying is that I'm available to any type that confomrs to Has2Feet
/// if that type brings me in but I'm not available on any other type even if they bring m in
mixin CanRun on Has2Feet {
  void run() {
    print('$runtimeType is running');
  }
}

class HasNoFeet {
  const HasNoFeet();
}

class Fish extends HasNoFeet {
  const Fish();
}
