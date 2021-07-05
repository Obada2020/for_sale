import 'package:flutter/material.dart';
import '../constant/constant.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController Num = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
          title: Center(
            child: Text(
              'تفعيل الحساب',
              style: klabelAppbarStyle,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          width: size.width,
          height: size.height * 0.3718662953,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 17, 12, 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                child: Text(
                  'تفعيل الحساب',
                  style: klabelStyleBlack14,
                ),
                padding: EdgeInsets.only(bottom: 11),
              ),
              Padding(
                child: Text(
                  'لقد أرسلنا رمز إلى رقم جوالك 0592036504 يحتوي على رمز تفعيل من 6 خانات',
                  style: klabelStyleBold11,
                ),
                padding: EdgeInsets.only(bottom: 23),
              ),
              Padding(
                child: Container(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Color(0xFF231F1F)),
                          borderRadius: BorderRadius.circular(4)),
                      hintText: "789 456 123",
                      hintStyle:
                          TextStyle(fontSize: 12, color: Color(0xFF333333)),
                    ),
                  ),
                ),
                padding: EdgeInsets.only(bottom: 8),
              ),
              Padding(
                child: Row(
                  children: [
                    Text(
                      'لم تستلم رمز؟',
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'إعادة الإرسال',
                        style: klabelStyleBold11,
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.only(bottom: 20),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: kGColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 41,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'تفعيل',
                      style: kBottonSubmitStyleBold13,
                    )),
              ),
            ]),
          ),
        ));
  }
}
