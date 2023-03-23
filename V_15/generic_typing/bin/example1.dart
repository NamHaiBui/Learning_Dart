void main(List<String> args) {
  WhatToReturn.int;
  final doubleValue = eitherIntOrDouble(WhatToReturn.double) as double;
  print(doubleValue);
}

enum WhatToReturn { int, double }

T eitherIntOrDouble<T extends num>(WhatToReturn whatToReturn) {
  switch (whatToReturn) {
    case WhatToReturn.int:
      return 1 as T;
    case WhatToReturn.double:
      return 1.0 as T;
    default:
      return 1 as T;
  }
}
