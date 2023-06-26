import 'package:objectbox/objectbox.dart';

@Entity()
class EmployeeDetail {
  String name;
  String username;
  int personAge;
  int id;

  EmployeeDetail(this.username,this.name, this.personAge, {this.id = 0});
}
