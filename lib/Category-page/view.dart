import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsetsDirectional.only(end: 50),
            child: Center(
              child: Text(
                "لابتوبات",
                style: klabelAppbarStyle,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
        ),
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5),
          itemBuilder: (BuildContext context, int index) {
            return containerCategory();
          },
        ));
  }

  Widget containerCategory() {
    return Container(
      height: 160.0,
      width: 110.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 20, end: 20, top: 15.1),
        child: Center(
          child: Column(
            children: [
              Image.asset("img/5321.jpg"),
              SizedBox(height: 11.2),
              Text(
                "منازل للبيع",
                style: klabelStyleTitleCategory,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
