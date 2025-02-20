import 'package:beginer_tutorial/model/person.dart';

class User extends Person{
  String user_id;
  String user_name;

  User(this.user_id, this.user_name) : super(18, 'Kim', 'female', '1234321');

  @override
  String toString() {
    // TODO: implement toString
    return '$user_id - $user_name - ${super.to_string()}';
  }
}