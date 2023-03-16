void main(List<String> args) {
  sayHelloTo('Bob!');
  // You need to specify the value to be assigned to the variable of your choice (Similar to packaging context of React)
  sayHelloToOptionalParam(name: 'bob');
}

void sayHelloTo(String name) {
  print('Hello , $name!');
}

// If your params are placed in a {}, they either need to have a default value or they need to be optional.
void sayHelloToOptionalParam({String? name}) {
  print('Hello , $name!');
}
