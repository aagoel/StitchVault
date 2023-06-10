import 'package:flutter/material.dart';
import 'package:new_project/design.dart';
import 'package:new_project/payments.dart';
import 'package:new_project/user.dart';
import 'package:new_project/work_entries.dart';
import 'appbar.dart';

/// Flutter code sample for [BottomNavigationBar].

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {

  void _onItemTapped(int index) {
    switch (index) {
      case 0: Navigator.push(context, MaterialPageRoute(builder: (context) => const User()));
      case 1: Navigator.push(context, MaterialPageRoute(builder: (context) => const Design()));
      case 2: Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkEntries()));
      case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => const Payments()));
      break;
    }
  }
  
  final String title='StitchVault';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: title),
      body: const Center(
        child: Text('This is Homepage')
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            label: 'Designs',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Work Entries',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee_outlined),
            label: 'Payments',
            backgroundColor: Colors.blue
          ),
        ],
        onTap: _onItemTapped,
        selectedItemColor: Colors.grey
      ),
    );
  }
}
