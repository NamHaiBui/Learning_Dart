import 'dart:mirrors';

void main(List<String> args) {
  /// reflections works using a mirror system.
  /// the key to reflection in dart is a function called reflect
  /// this reflect function will give you an object of type instance mirror
  /// using this instance mirror you can get the name of the type that you are reflecting upon, and
  /// the type declaration which will give you a list of functions availble on that types and the variables in that type
  final person = Person(age: 30, name: 'John');
  print(person);
  final house = House(address: '28N', owner: person);
  print(house);
}

// class Person {
//   final String firstName; // this is a field
// }
/// this is a mixin that just brings functionality to the types
mixin HasDescription {
  @override
  String toString() {
    final reflection = reflect(this);
    final thisType = MirrorSystem.getName(
      reflection.type.simpleName,
    );
    final variables =
        reflection.type.declarations.values.whereType<VariableMirror>();
    final properties = <String, dynamic>{
      for (final field in variables)
        field.asKey: reflection
            .getField(
              field.simpleName,
            )
            .reflectee,
    }.toString();
    return '$thisType = $properties';
  }
}

extension AsKey on VariableMirror {
  String get asKey {
    final fieldName = MirrorSystem.getName(simpleName);
    final fieldType = MirrorSystem.getName(type.simpleName);
    return '$fieldName ($fieldType)';
  }
}

class Person with HasDescription {
  final String name;
  final int age;
  const Person({required this.name, required this.age});
}

class House with HasDescription {
  final String address;
  final Person owner;
  const House({required this.address, required this.owner});
}
