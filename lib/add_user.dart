import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Add USer'),
      // ),
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
