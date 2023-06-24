import 'package:flutter/material.dart';
import 'appbar.dart';
import 'edit_user.dart';
import 'add_user.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserBottomNavigationBarExampleState();
}

class _UserBottomNavigationBarExampleState extends State<User> {
  int _selectedIndex = 0;
  final String title = "User";
  final List<Widget> _widgetOptions = <Widget>[
    const DropdownButtonExample(),
    LoginPage(),
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
