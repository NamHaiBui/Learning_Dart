void main(List<String> args) {
  print(add(1, 1));
}

int add([int? a, int? b]) {
  return a + b;
}

void bla(int? value1, int? value2) {
  final result = value1 + value2;
}

extension NullableAdd<T extends num> on T? {
  T operator +(T? other) {
    final thisShadow = this;
    // if (thisShadow != null || other == null){
    //   return null;
    // }else{
    //   return thisShadow + other as T;
    // }
    if (this != null && other == null) {
      return this as T;
    } else if (this == null && other != null) {
      return other as T;
    } else if (this == null && other == null) {
      return 0 as T;
    } // dart runs into some trouble promoting the current type
    else if (thisShadow != null && other != null) {
      return thisShadow + other as T;
    } else {
      return 0 as T;
    }
  }
}
