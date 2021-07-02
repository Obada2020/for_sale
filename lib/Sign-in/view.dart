import 'package:flutter/material.dart';
import '../constant/constant.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        height: size.height * 0.32,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 17, 12, 15),
          child: Column(children: [
            Text(
              'تسجيل الدخول',
              style: klabelStyleBlack14,
            ),
            Text(
              'أدخل رقم هاتفك للدخول إلى التطبيق ، مرحبا بك مجددا',
              style: klabelStyleBold11,
            ),
            Text(
              'رقم الهاتف',
              style: klabelStyleBold11,
            ),
            TextField(),
            Text(
              'بالنقر على متابعة ، فأنت توافق على شروط وسياسة المستخدم',
              style: klabelStyleBold11,
            ),
            TextButton(
                onPressed: null,
                child: Text(
                  'تسجيل الدخول',
                  style: kBottonSubmitStyleBold13,
                )),
          ]),
        ),
      ),
    );
  }
}
