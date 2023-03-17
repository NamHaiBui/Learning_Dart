void main(List<String> args) {
  const names = ['John', 'Paul', 'George', 'Ringo'];
  var counter = 0;
  while (counter < names.length) {
    print(names[counter++]);
  }
  counter = 0;
  while (counter++ < names.length) {
    print(names[counter]);
  }
  //right
  counter = 0;
  while (counter < names.length) {
    print(names[counter]);
    counter++;
  }
  counter = names.length;
  while (--counter >= 0) {
    print(names[counter]);
  }
  // code first check later
  counter = 0;
  do {
    print(names[counter++]);
  } while (counter < names.length);

  counter = 0;
  do {
    print(names[counter]);
    if (counter == 2) {
      break;
    }
  } while (counter < names.length);
  // consider the condition after its block of code has been executed
  do {
    final name = names[counter++];
    if (name == 'George') {
      continue;
    }
    print(name);
  } while (counter < names.length);
}
