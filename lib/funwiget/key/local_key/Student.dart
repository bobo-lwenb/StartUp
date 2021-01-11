class Student {
  String name;
  int age;

  Student(this.name, this.age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Student && runtimeType == other.runtimeType && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
