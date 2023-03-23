void main(List<String> args) {
  print('Heh'.reversed);
}

extension on String {
  // If it is not a function then it is a getter
  String get reversed => split('').reversed.join();
}
