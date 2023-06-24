import 'package:flutter/material.dart';
import 'package:new_project/data_models.dart';
import 'package:new_project/main.dart';
import 'appbar.dart';

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
  String dropdownValue = list.first.name;

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
      items: list.map<DropdownMenuItem<String>>((EmployeeDetail value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String employeeName = "";
  String employeeAge = "";

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController ageEditingController = TextEditingController();

    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: nameEditingController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
                hintText: 'Admin', labelText: 'Name of employee'),
          ),
          TextFormField(
            controller: ageEditingController,
            decoration: const InputDecoration(hintText: '45', labelText: 'Age'),
          ),
          Container(
            width: screenSize.width,
            margin: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
                onPressed: () {
                  employeeName = nameEditingController.text;
                  employeeAge = ageEditingController.text;
                  objectbox.employeeBox.put(EmployeeDetail(
                      name: employeeName, personAge: employeeAge));
                  list.add(EmployeeDetail(
                      name: employeeName, personAge: employeeAge));
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
