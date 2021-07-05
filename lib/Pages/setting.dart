import 'package:flutter/material.dart';
import '../constant/constant.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'الإعدادات',
            style: klabelAppbarStyle,
          ),
        )),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اللغة'),
          ],
        ),
      ),
    );
  }
}
