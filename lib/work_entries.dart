import 'package:flutter/material.dart';
import 'appbar.dart';

class WorkEntries extends StatelessWidget {
  const WorkEntries({super.key});

  final String title="Work Entries";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: title),
        body: const Center(child: Text('This is Work Entries Page'))
      );
  }
}