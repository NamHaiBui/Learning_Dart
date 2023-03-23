void main(List<String> args) {
  final dad = FamilyMember(name: 'Dad');
  final mom = FamilyMember(name: 'Mom');
  final family = dad + mom;
  print(family);
}

class FamilyMember {
  final String name;
  FamilyMember({required this.name});
  @override
  String toString() => 'Family member (name = $name)';
}

class Family {
  final List<FamilyMember> members;
  const Family({required this.members});
  @override
  String toString() => 'Family (members = $members)';
}

extension ToFamily on FamilyMember {
  // Dad + Mom
  // this + other
  Family operator +(FamilyMember other) => Family(members: [this, other]);
}
