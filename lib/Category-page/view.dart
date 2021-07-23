import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view.dart';
import 'package:for_sale/Category-page/model.dart';
import 'package:for_sale/Category-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  var parameter;
  CategoryPage({this.parameter});

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
                widget.parameter['title_navbar'],
                style: klabelAppbarStyle,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
        ),
        body: GetX<CategoryController>(
            init: CategoryController(
                adCatogaryId: widget.parameter['ad_catogary_id'],
                catogaryDetailsId: widget.parameter['catogary_details_id']),
            builder: (ctrl) {
              return GridView.builder(
                itemCount: ctrl.categoryList.value.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5),
                itemBuilder: (BuildContext context, int index) {
                  return containerCategory(
                      categ: ctrl.categoryList.value[index]);
                },
              );
            }));
  }

  Widget containerCategory({CategoryModel? categ}) {
    return GestureDetector(
      child: Container(
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
                  categ!.adDetailsDescription.toString(),
                  style: klabelStyleTitleCategory,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        var paras = {
          "category_type": widget.parameter['ad_catogary_id'],
          "category_details": widget.parameter['catogary_details_id'],
          "category_ad": categ.adCatogaryId,
        };
        Get.to(Ads());
      },
    );
  }
}
