void main(List<String> args) {
  print([...TeslaCars.values]..sort());
}

enum TeslaCars implements Comparable<TeslaCars> {
  modelS(weightInKg: 2.1),
  model3(weightInKg: 2.2),
  modelX(weightInKg: 2.23),
  modelY(weightInKg: 2.24);

  final double weightInKg;
  const TeslaCars({required this.weightInKg});

  @override
  int compareTo(TeslaCars other) {
    return weightInKg.compareTo(other.weightInKg);
  }
}
