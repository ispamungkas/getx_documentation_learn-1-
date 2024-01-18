class Person{
  String? name;
  int? age;

  Person({this.name, this.age});

  Map<String, dynamic> toJson() {
    return {'name' : name, 'age' : age};
  }

  factory Person.fromJson(Map<String, dynamic> json) => Person(name: json['name'], age: json['age']);

}