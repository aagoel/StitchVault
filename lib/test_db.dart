import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:objectbox/objectbox.dart';

// void main() async {
//   // Avoid errors caused by flutter upgrade.
//   // Importing 'package:flutter/widgets.dart' is required.
//   WidgetsFlutterBinding.ensureInitialized();
//   // Open the database and store the reference.
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'employee_database.db'),
//     // When the database is first created, create a table to store employees.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         'CREATE TABLE employees(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );

//   // Define a function that inserts employees into the database
//   Future<void> insertEmployee(Employee employee) async {
//     // Get a reference to the database.
//     final db = await database;

//     // Insert the employee into the correct table. You might also specify the
//     // `conflictAlgorithm` to use in case the same employee is inserted twice.
//     //
//     // In this case, replace any previous data.
//     await db.insert(
//       'employees',
//       employee.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   // A method that retrieves all the employees from the employees table.
//   Future<List<Employee>> employees() async {
//     // Get a reference to the database.
//     final db = await database;

//     // Query the table for all The employees.
//     final List<Map<String, dynamic>> maps = await db.query('employees');

//     // Convert the List<Map<String, dynamic> into a List<employee>.
//     return List.generate(maps.length, (i) {
//       return Employee(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         age: maps[i]['age'],
//       );
//     });
//   }

//   Future<void> updateEmployee(Employee employee) async {
//     // Get a reference to the database.
//     final db = await database;

//     // Update the given employee.
//     await db.update(
//       'employees',
//       employee.toMap(),
//       // Ensure that the employee has a matching id.
//       where: 'id = ?',
//       // Pass the employee's id as a whereArg to prevent SQL injection.
//       whereArgs: [employee.id],
//     );
//   }

//   Future<void> deleteEmployee(int id) async {
//     // Get a reference to the database.
//     final db = await database;

//     // Remove the employee from the database.
//     await db.delete(
//       'employee',
//       // Use a `where` clause to delete a specific employee.
//       where: 'id = ?',
//       // Pass the employee's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }

//   // Create a employee and add it to the employees table
//   var fido = const Employee(
//     id: 0,
//     name: 'Fido',
//     age: 35,
//   );

//   await insertEmployee(fido);

//   // Now, use the method above to retrieve all the employees.
//   print(await employees()); // Prints a list that include Fido.

//   // Update Fido's age and save it to the database.
//   fido = Employee(
//     id: fido.id,
//     name: fido.name,
//     age: fido.age + 7,
//   );
//   await updateEmployee(fido);

//   // Print the updated results.
//   print(await employees()); // Prints Fido with age 42.

//   // Delete Fido from the database.
//   await deleteEmployee(fido.id);

//   // Print the list of employees (empty).
//   print(await employees());
// }

// class Employee {
//   final int id;
//   final String name;
//   final int age;

//   const Employee({
//     required this.id,
//     required this.name,
//     required this.age,
//   });

//   // Convert a employee into a Map. The keys must correspond to the names of the
//   // columns in the database.
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'age': age,
//     };
//   }

//   // Implement toString to make it easier to see information about
//   // each employee when using the print statement.
//   @override
//   String toString() {
//     return 'Employee{id: $id, name: $name, age: $age}';
//   }
// }

@Entity()
class PersonDetail {
  String name;
  int personAge;
  int id;

  PersonDetail({this.name, this.lastName, this.personAge});
}
