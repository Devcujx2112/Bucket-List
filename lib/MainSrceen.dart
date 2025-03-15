import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mainsrceen extends StatefulWidget {
  const Mainsrceen({super.key});

  @override
  State<Mainsrceen> createState() => _MainsrceenState();
}

class _MainsrceenState extends State<Mainsrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Bucket List'),),);
  }
}
