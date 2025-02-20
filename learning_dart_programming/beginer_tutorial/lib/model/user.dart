class User{
  // TODO: Attribute declaration (Khỏi tạo các thuộc tính của class)
  // todo: Public variables
  int id;
  String name;
  // todo: Private variables
  String _password;

  // TODO: Constructor (hàm khởi tạo)
  User(this.id, this.name, this._password);

  // TODO: Getter and Setter
  // No Getter => can't print
  // No Setter => can't change
  String get password => _password;

  set password(String value) {
    _password = value;
  }

  // TODO: Display info using toString
  @override
  String toString() {
    // TODO: implement toString
    // Check admin
    return (name == 'admin') ?
    '$id - $name - $_password' : '$id - $name';
  }
}