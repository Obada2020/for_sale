import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
         
        ),
        body: Stack(
          children: [
            Positioned(
                child: Container(
              color: Colors.red,
              width: size.width,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.green,
                    width: 50,
                    height: 50,
                  );
                },
                itemCount: 20,
              ),
            ))
          ],
        ));
  }
}
