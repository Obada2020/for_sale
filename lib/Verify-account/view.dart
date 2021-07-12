import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../constant/constant.dart';

//String? x = "";

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
                  width: size.width,
                  child: OTPTextField(
                    length: 6,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    keyboardType: TextInputType.number,
                    outlineBorderRadius: 4,
                    fieldWidth: size.width * 0.1256684492,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.grey.shade200,
                      disabledBorderColor: Colors.white,
                      enabledBorderColor: Colors.white,
                    ),
                    onChanged: (k) {
                      if (k != null) {}
                    },
                    onCompleted: (n) {
                      // print("Completed: " + pin);
                      // print(n);
                    },
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
                width: size.width,
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
