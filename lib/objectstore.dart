import 'objectbox.g.dart';
import 'data_models.dart';

class ObjectBox {
  late final Store store;

  late final Box<EmployeeDetail> employeeBox;

  ObjectBox._create(this.store) {
    employeeBox = Box<EmployeeDetail>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    // await openStore(directory: p.join(docsdir.path, "obx-example"));

    return ObjectBox._create(store);
  }
}
