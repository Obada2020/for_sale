import 'package:flutter/material.dart';
import 'package:for_sale/Add-ad/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}
