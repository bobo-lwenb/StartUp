import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';

@JsonSerializable()
class Person {
  String name;
  String age;

  Person({this.name, this.age});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
