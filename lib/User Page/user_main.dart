import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/main.dart';
import '../appbar.dart';
import 'user_edit.dart';
import '../Database Objects/data_models.dart';
import 'user_add.dart';

List<EmployeeDetail> list = objectbox.employeeBox.getAll();

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserBottomNavigationBarExampleState();
}

class _UserBottomNavigationBarExampleState extends State<User> {
  int _selectedIndex = 0;
  final String title = "User";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const EmployeeDropDown(),
    const Text(
      'Home Page',
      style: optionStyle,
    ),

    const AddUserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: title),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_square),
            label: 'Edit User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}



