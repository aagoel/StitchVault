import 'package:flutter/material.dart';
import '../appbar.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  final String title="Payments";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: title),
        body: const Center(child: Text('This is Payments Page'))
      );
  }
}