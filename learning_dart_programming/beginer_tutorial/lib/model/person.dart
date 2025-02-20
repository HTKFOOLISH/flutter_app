class Person{
  // TODO: Attribute declaration (Khỏi tạo các thuộc tính của class)
  // todo: Public variables
  int age;
  String name;
  String gender;
  // todo: Private variables
  String _id;

  // TODO: Constructor (hàm khởi tạo)
  Person(this.age, this.name, this.gender, this._id);

  // TODO: Getter and Setter
  // No Getter => can't print
  // No Setter => can't change
  String get id => _id;

  set id(String value) {
    _id = value;
  }

  // TODO: Display info using toString
  @override
  String to_string() {
    // TODO: implement toString
    return '$name - $age - $gender - $_id';
  }
}