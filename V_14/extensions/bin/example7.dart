import 'dart:math' show Random;

void main(List<String> args) {
  print(add.callWithRandomValues());
  print(subtract.callWithRandomValues());
}

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;
// define a type
typedef IntFunction = int Function(int, int);

extension on IntFunction {
  int callWithRandomValues() {
    final rnd1 = Random().nextInt(100);
    final rnd2 = Random().nextInt(100);
    // Call the current function with the given params
    print('random vals = $rnd1, $rnd2');
    return call(rnd1, rnd2);
  }
}
