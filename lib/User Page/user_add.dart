import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/main.dart';
import '../Database Objects/data_models.dart';




class AddUserPage extends StatefulWidget {

  const AddUserPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<EmployeeDetail> list = objectbox.employeeBox.getAll();

  void addUser() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      EmployeeDetail emp = EmployeeDetail(username.toString(),employeeName.toString(),int.parse(employeeAge.toString()));
      objectbox.employeeBox.put(emp);
      list = objectbox.employeeBox.getAll();
    }
  }

  String? employeeName;
  String? employeeAge;
  String? username;


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    TextEditingController editUsername = TextEditingController();
    TextEditingController editName = TextEditingController();
    TextEditingController editAge = TextEditingController();

    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: editUsername,
            keyboardType:
                TextInputType.name, // Use email input type for emails.
            decoration: const InputDecoration(
                hintText: 'Admin', labelText: 'Username of employee'),
            onSaved: (String? value) {
              username = value;
              editUsername.clear();
            },
            validator: (value) {
              if (value != null && value.isEmpty){
                return 'Please enter valid username';
              }
              else{
                for (var i = 0;i<list.length;i++){
                  if(list[i].username == value){
                    return 'Username already exists';
                  }
                }
                return null;
              }
            }),
          TextFormField(
            controller: editName,
            keyboardType:
                TextInputType.name, // Use email input type for emails.
            decoration: const InputDecoration(
                hintText: 'Admin', labelText: 'Name of employee'),
            onSaved: (String? value) {
              employeeName = value;
              editName.clear();
            },
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please Enter a Name';
              }
              return null;
            }),
          TextFormField(
            controller: editAge,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: '45', labelText: 'Age'),
            onSaved: (String? value) {
              employeeAge = value;
              editAge.clear();
            },
            validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please Enter Age';
                }
                return null;
              }
          ),
          Container(
            width: screenSize.width,
            margin: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
                onPressed: addUser,
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ))
          )
        ],
      ),
    );
    // ),
    // );

  }
}