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
                'تفعيل الحساب',
                style: klabelAppbarStyle,
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(12, 17, 12, 0),
          width: size.width,
          height: size.height * 0.38,
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
                padding: EdgeInsets.only(bottom: 8),
              ),
              Padding(
                child: Text(
                  'لقد أرسلنا رمز إلى رقم جوالك 0592036504 يحتوي على رمز تفعيل من 6 خانات',
                  style: klabelStyleBold11,
                ),
                padding: EdgeInsets.only(bottom: 30),
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
                padding: EdgeInsets.only(bottom: 10),
              ),
              Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                padding: EdgeInsets.only(bottom: 15),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: kGColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                //height: 41,
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
