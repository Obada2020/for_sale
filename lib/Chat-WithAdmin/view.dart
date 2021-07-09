import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';

class ChatUI extends StatefulWidget {
  ChatUI({Key? key}) : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  var text = TextEditingController();
  List<Widget> messages = <Widget>[
    Message(true, "السلام عليكم ورحمة الله", DateTime.now()),
    SizedBox(height: 24),
    Message(false, "السلام عليكم ورحمة الله", DateTime.now()),
    SizedBox(height: 24),
    Message(true, "السلام عليكم ورحمة الله", DateTime.now()),
    SizedBox(height: 24),
    Message(false, "السلام عليكم ورحمة الله", DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التواصل المباشر مع الإدارة"),
        centerTitle: true,
        backgroundColor: Color(0xFF586682),
        leading: Icon(Icons.arrow_back_rounded),
      ),
      body: Container(
        color: Color(0xFFF2F2F2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: messages),
              ),
            ),
            Container(
              height: 70,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          messages.add(
                            Message(false, text.text, DateTime.now()),
                          );
                        });
                      },
                      icon: Icon(
                        Icons.send,
                        textDirection: TextDirection.ltr,
                      )),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 14, top: 18, bottom: 18, right: 24),
                      child: TextFormField(
                        controller: text,
                        decoration: InputDecoration(
                            // hintText: "اكتب رسالة",
                            labelText: "اكتب رسالة",
                            suffixIcon: Icon(Icons.camera),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFDEDEDE), width: 1.0),
                            ),
                            // filled: true,
                            fillColor: Color(0xFFF2F2F2),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF707070).withOpacity(0.09),
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  Message(this.isAdmin, this.text, this.date);
  final bool? isAdmin;
  final String? text;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: isAdmin! ? TextDirection.ltr : TextDirection.rtl,
      // mainAxisAlignment:
      //     isAdmin! ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        SizedBox(width: 6),
        CircleAvatar(
          backgroundColor: Colors.red,
          backgroundImage: AssetImage("img/batman.png"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                text!,
                style: TextStyle(
                    fontSize: 19,
                    color: isAdmin! ? Colors.white : Color(0xFF626C75)),
              ),
              decoration: BoxDecoration(
                color: isAdmin! ? Color(0xFF586682) : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Text("0.1:18 ص")
          ],
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
