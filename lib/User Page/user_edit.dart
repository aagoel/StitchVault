import 'package:flutter/material.dart';
import 'package:new_project/main.dart';

import '../Database Objects/data_models.dart';





class EmployeeDropDown extends StatefulWidget {
  const EmployeeDropDown({super.key});

  @override
  State<EmployeeDropDown> createState() => _EmployeeDropDownState();

  
}

class _EmployeeDropDownState extends State<EmployeeDropDown> {
  
  List<EmployeeDetail> list = objectbox.employeeBox.getAll();
  String? dropdownValue;

  _EmployeeDropDownState (){
    list = objectbox.employeeBox.getAll();
    if(list.isEmpty){
      EmployeeDetail empDet = EmployeeDetail("None","None",-1);
      list.add(empDet);
    }
    else{
      EmployeeDetail empDet = EmployeeDetail("None","None", -1);
      list.remove(empDet);
    }
    dropdownValue = list.first.username;
  }


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
      items: list.map<DropdownMenuItem<String>>((EmployeeDetail employee) {
        return DropdownMenuItem<String>(
          value: employee.username,
          child: Text(employee.name),
        );
      }).toList(),
    );
  }
}
