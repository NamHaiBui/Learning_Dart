import 'dart:html';

void main(List<String> args) {
  int? age = 20;
  age = null;
  if (age == null) {
    print('Age is null');
  } else {
    print('Age is not null');
  }
}

void something(int? age) {
  if (age == null) {
    print('Age is null');
  } else {
    print('Age is not null');
  }
}
