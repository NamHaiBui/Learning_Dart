void main(List<String> args) {
  const JSON<String> json = {
    'name': 'John',
    'age': '30',
  };
  print(json);
}

typedef JSON<T> = Map<String, T>;
