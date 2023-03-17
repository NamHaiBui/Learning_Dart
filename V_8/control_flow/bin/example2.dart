void main(List<String> args) {
  const names = ['Foo', 'Bar', 'Baz', 'Qux'];
  for (var i = 0; i < names.length; i++) {
    print(names[i]);
  }
  // i-- run the for code before decrementing i
  for (var i = names.length - 1; i >= 0; i--) {
    print(names[i]);
  }
  for (var i = 0; i < names.length; i += 2) {
    print(names[i]);
  }
}
