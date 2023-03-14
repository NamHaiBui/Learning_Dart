void main(List<String> args) {
  var age = 30;
  // Unary Prefix: Operates Before 1 value (sit before)
  print(--age); // substract 1 from age(also modifying the variable itself)
  int age2 = ++age; // adding 1 from age(also modifying the variable itself)
  print(age2);
  ++age;
  print(age);
  print(!true); // Flip the boolean value(does not modify the variable itself)
  /// Unary bitwise completement prefix operator
  print(~1); // Convert this into a 32-bit value and flip all 0 to 1 and 1 to 0
  print(-age); // Negate the int value(does not modify the variable itself)
  // Unary Postfix:Operates after 1 value (sit before)
  // Binary Infix: Operating on 2 value (sit between)
  // Compound Assigment:
}
