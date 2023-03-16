void main(List<String> args) {
  print(minus());
  print(minus(2, 4));
  int performOperation(int a, int b, int Function(int, int) operation) =>
      operation(a, b);
  print(performOperation(10, 20, add));
  print(performOperation(10, 20, minus));
}

// Function can also be arrow function
int minus([int lhs = 10, int rhs = 5]) => lhs - rhs;
int add([int lhs = 10, int rhs = 5]) => lhs + rhs;
/// First class functions
/// Anything that can be describe as a data type can be passed in as a parameter 

