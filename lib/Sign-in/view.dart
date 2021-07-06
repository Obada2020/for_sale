import 'package:flutter/material.dart';
import '../constant/constant.dart';

class Signin extends StatelessWidget {
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
            'تسجيل الدخول',
            style: klabelAppbarStyle,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        width: size.width,
        height: size.height * 0.3467966574,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 17, 12, 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              child: Text(
                'تسجيل الدخول',
                style: klabelStyleBlack14,
              ),
              padding: EdgeInsets.only(bottom: 11),
            ),
            Padding(
              child: Text(
                ' مرحبا بك مجددا , أدخل رقم هاتفك للدخول إلى التطبيق',
                style: klabelStyleBold11,
              ),
              padding: EdgeInsets.only(bottom: 23),
            ),
            Padding(
              child: Text(
                'رقم الهاتف',
                style: klabelStyleBold11,
              ),
              padding: EdgeInsets.only(bottom: 9),
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
              child: Text(
                'بالنقر على متابعة ، فأنت توافق على شروط وسياسة المستخدم',
                style: klabelStyleBold11,
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
                    'تسجيل الدخول',
                    style: kBottonSubmitStyleBold13,
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
