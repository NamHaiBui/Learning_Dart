void main(List<String> args) {
  Animaltype.cat
    ..jump()
    ..run();
  Animaltype.rabbit
    ..jump()
    ..run();
  Animaltype.dog
    ..jump()
    ..run();
}

enum Animaltype {
  cat,
  dog,
  rabbit;

  void run() {
    print('Running...');
  }
}

extension Jump on Animaltype {
  void jump() {
    print('$this is jumping ....');
  }
}
