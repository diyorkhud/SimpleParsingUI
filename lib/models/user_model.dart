class User{
  late String name;
  late int salary;
  late int age;
  late int id;


  User({required this.name, required this.salary, required this.age, required this.id});

  User.fromJson(Map < String, dynamic > json)
      : name = json ['name'] ,
        salary = json ['salary'],
        age = json ['age'],
        id = json ['id'];



  Map<String, dynamic > toJson()=> {
    'name' : name ,
    'salary' : age ,
    'age': age,
    'id': id,
  };
}