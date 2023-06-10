import 'package:flutter/material.dart';
import 'appbar.dart';

class Design extends StatelessWidget {
  const Design({super.key});

  final String title="Designs";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: title),
        body: const Center(child: Text('This is Design Page'))
      );
  }
}