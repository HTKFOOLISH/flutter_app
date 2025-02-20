import 'package:beginer_tutorial/model/user.dart';

class Studentuser extends User{
  String mssv;

  Studentuser(int id, String name, String _password, this.mssv) : super(id, name, _password);

  @override
  String toString() {
    // TODO: implement toString
    return '${super.toString()} - $mssv';
  }
}