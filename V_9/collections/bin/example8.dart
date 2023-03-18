import 'dart:collection';

void main(List<String> args) {
  final info = {
    'a': 'da',
  };
  final info2 = UnmodifiableMapView(info);
  info.addAll({
    'phone': '123-345-7890',
  });
  try {
    info2.addAll({
      'phone': '123-345-7890',
    });
  } catch (e) {
    print(e);
  }
}
