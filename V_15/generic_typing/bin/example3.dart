void main(List<String> args) {
  const momAndDad = {
    'mom': Person(),
    'dad': Person(),
  };
  const brotherAndSisterAndFish = {
    'brother': Person(),
    'sister': Person(),
    'fishy': Fish(),
  };
  final allValues = [
    momAndDad,
    brotherAndSisterAndFish,
  ];
  descrive(allValues);
}

typedef AirBenders<T extends CanBreathe> = Map<String, CanBreathe>;
void descrive(Iterable<AirBenders> values) {
  for (final map in values) {
    for (final keyAndValues in map.entries) {
      print('Will call breathe() on ${keyAndValues.key}');
      keyAndValues.value.breathe();
    }
  }
}

mixin CanBreathe {
  void breathe();
}

class Person with CanBreathe {
  const Person();
  @override
  void breathe() {
    print('Person is breathing....');
  }
}

class Fish with CanBreathe {
  const Fish();
  @override
  void breathe() {
    print('Fish is breathing under da water');
  }
}
