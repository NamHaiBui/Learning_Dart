void main(List<String> args) {
  final myCar = Car();

  myCar.drive(speed: 20);
  myCar.drive(speed: 30);
  myCar.stop();
}

class Car {
  // This keyword value can be get and set
  int speed = 0;
  void drive({required int speed}) {
    {
      this.speed = speed;
      print('Changing speed to $speed');
    }
    ;
  }

  void stop() {
    speed = 0;
    print('Stopping...');
  }
}
