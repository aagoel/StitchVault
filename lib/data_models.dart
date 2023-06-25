import 'package:objectbox/objectbox.dart';

@Entity()
class EmployeeDetail {
  String name;
  int personAge;
  int id;

  EmployeeDetail(this.name, this.personAge, {this.id = 0});
}
