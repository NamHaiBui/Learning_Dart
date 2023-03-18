void main(List<String> args) {
  final string = 'abracadabra';
  var result = {
    for (final char in string.split('')) 'abc'.contains(char) ? null : char
  }
    ..removeAll([null])
    ..cast<String>();
  final allNumbers = Iterable.generate(100);
  final evenNumbers = [
    for (final number in allNumbers)
      {
        if (number % 2 == 0) {number}
      }
  ];
  final evenNumbersFuncitonal = allNumbers.where(
    (num) => num % 2 == 0,
  );
}
