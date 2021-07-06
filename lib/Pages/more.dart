import 'package:flutter/material.dart';

class More extends StatefulWidget {
  More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("more"));
  }
}
