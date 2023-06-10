import 'package:flutter/material.dart';
import 'appbar.dart';

class User extends StatelessWidget {
  const User({super.key});

  final String title="User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: title),
        body: const Center(child: Text('This is User Page'))
      );
  }
}