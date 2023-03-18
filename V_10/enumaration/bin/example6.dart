void main(List<String> args) {
  AnimalType.cat.jump();
  try {
    AnimalType.fish.jump();
  } catch (e) {
    print(e);
  }
}

mixin CanJump {
  int get feetCount;
  void jump() {
    if (feetCount < 1) {
      throw Exception('Cannot jump');
    } else {
      print('Jumped!');
    }
  }
}

enum AnimalType with CanJump {
  fish(feetCount: 0),
  cat(feetCount: 4);

  @override
  final int feetCount;
  const AnimalType({
    required this.feetCount,
  });
}
