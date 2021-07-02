import 'package:flutter/material.dart';
import 'package:for_sale/style.dart';

class AddUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("إضافة إعلان"),
          centerTitle: true,
          backgroundColor: gg,
          actions: [
            Icon(Icons.arrow_forward),
            SizedBox(width: 15),
          ],
        ),
        body: Container(
          color: Color(0xFFF2F2F2),
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "نوع الأعلان",
                      ),
                    ),

                      
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
