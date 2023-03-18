void main(List<String> args) {
  describe(animal(fromStr: 'horse'));
  describe(animal(fromStr: 'cat'));
}

void describe(AnimalType? animalType) {
  switch (animalType) {
    case AnimalType.rabbit:
      print("This is a rabbit");
      break;
    case AnimalType.dog:
      print('This is a dog');
      break;
    case AnimalType.cat:
      print('This is a cat');
      break;
    case AnimalType.human:
      print('This is a homosapien');
      break;
    default:
      print('Unknown animal');
      break;
  }
}

enum AnimalType {
  rabbit,
  dog,
  cat,
  human,
}

AnimalType? animal({
  required String fromStr,
}) {
  try {
    return AnimalType.values
        .firstWhere((element) => ((element.name == fromStr)));
  } catch (e) {
    return null;
  }
}
