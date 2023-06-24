import 'package:flutter/material.dart';
import 'appbar.dart';

const List<String> list = <String>[
  'Employee 1',
  'Employee 2',
  'Employee 3',
  'Employee 4'
];

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
    AddUserPage(),
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

class EmployeeDropDown extends StatefulWidget {
  const EmployeeDropDown({super.key});

  @override
  State<EmployeeDropDown> createState() => _EmployeeDropDownState();
}

class _EmployeeDropDownState extends State<EmployeeDropDown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class AddUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                    keyboardType:
                        TextInputType.name, // Use email input type for emails.
                    decoration: const InputDecoration(
                        hintText: 'Admin', labelText: 'Name of employee')),
                TextFormField(
                    decoration: const InputDecoration(
                        hintText: '45', labelText: 'Age')),
                Container(
                  width: screenSize.width,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => null,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
