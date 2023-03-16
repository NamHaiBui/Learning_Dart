void main(List<String> args) {
  print(doNothing());
}

// If you don't have a return type then by default your return type is dynamic
doNothing() {} // == dynamic doNothing()
// return null if no return value is specified