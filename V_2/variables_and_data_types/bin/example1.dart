// fswatch -o bin/ | xargs -n1 -I{} sh -c 'clear; dart bin/example1.dart'
void main(List<String> args) {
  const name = 'Foos';
  print(name);
}
