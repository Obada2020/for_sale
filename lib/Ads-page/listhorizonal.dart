import 'package:flutter/material.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class ListHorizantol extends StatefulWidget {
  var parameterHorizantol;
  ListHorizantol({this.parameterHorizantol});

  @override
  _ListHorizantolState createState() => _ListHorizantolState();
}

class _ListHorizantolState extends State<ListHorizantol> {
  int selectindex = 0;

  @override
  void initState() {
    super.initState();
    print({
      "insde class horizantel =>>>>>>>>>>>>>>>>>>>__________________________":
          widget.parameterHorizantol
    });
        print({
      "insde class horizantel =>>>>>>>>>>>>>>>>>>>__________________________":
          widget.parameterHorizantol['ad_catogary_id']
    });
        print({
      "insde class horizantel =>>>>>>>>>>>>>>>>>>>__________________________":
          widget.parameterHorizantol['ad_descriptions_id']
    });
        print({
      "insde class horizantel =>>>>>>>>>>>>>>>>>>>__________________________":
          widget.parameterHorizantol['catogary_details_id']
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: kbodyColor,
      width: size.width,
      height: 60,
      child: GetX<AdsController>(
          init: AdsController(
              adCatogaryId: widget.parameterHorizantol['ad_catogary_id'],
              adDescriptionsId:
                  widget.parameterHorizantol['ad_descriptions_id'],
              catogaryDetailsId:
                  widget.parameterHorizantol['catogary_details_id']),
          builder: (ctrl) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int index) {
                return RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      selectindex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(13, 10, 13, 14),
                    padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff333333)),
                        gradient: selectindex == index
                            ? kGColor
                            : LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xffF2F2F2),
                                  Color(0xffF2F2F2),
                                ],
                              ),
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "${ctrl.scrlho[index].adTypeName},",
                      style: selectindex == index
                          ? klabelStyleBold11light
                          : klabelStyleBold11dark,
                    ),
                  ),
                );
              },
              itemCount: ctrl.scrlho.length,
            );
          }),
    );
  }
}
