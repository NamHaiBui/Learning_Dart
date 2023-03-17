void main(List<String> args) {}
void describe<T>(T value) {
  switch (T) {
    case int:
      print('This is an integer');
      break;
    case String:
      print('This is a String');
      break;
    case bool:
      print('This is a boolean');
      break;
    case Map<String, String>:
      print("This is a Map of String and String");
      break;
    default:
      print('This is something else');
  }
}
