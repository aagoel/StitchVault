import 'package:objectbox/objectbox.dart';

@Entity()
class EmployeeDetail {
  String name;
  String personAge;
  int id;

  EmployeeDetail({this.name = "", this.personAge = "", this.id = 0});
}
