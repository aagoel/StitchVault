import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'objectbox.g.dart';
import 'data_models.dart';

class ObjectBox {
  late final Store store;

  late final Box<EmployeeDetail> employeeBox;

  ObjectBox._create(this.store) {
    employeeBox = Box<EmployeeDetail>(store);
  }

  static Future<ObjectBox> create() async {
    final docsdir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsdir.path, "stitchVaultDB"));
    
    return ObjectBox._create(store);
  }
}
