import 'package:flutter/material.dart';
import 'package:for_sale/Chat-WithAdmin/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class ChatUI extends StatelessWidget {
  // List<Widget> messages = <Widget>[
  //   MessageWidget(true, "السلام عليكم ورحمة الله", DateTime.now()),
  //   SizedBox(height: 24),
  //   MessageWidget(false, "السلام عليكم ورحمة الله", DateTime.now()),
  //   SizedBox(height: 24),
  //   MessageWidget(true, "السلام عليكم ورحمة الله", DateTime.now()),
  //   SizedBox(height: 24),
  //   MessageWidget(false, "السلام عليكم ورحمة الله", DateTime.now()),
  // ];
  //

  //

  final text = TextEditingController();
  // @override
  // void dispose() {
  //   c!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    ChatController? c = Get.put(
        ChatController()); // for dispose the controller after closing this stateless page
    return Scaffold(
      appBar: AppBar(
        title: Text("التواصل المباشر مع الإدارة"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
      ),
      body: Container(
        // color: Color(0xFFF2F2F2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Expanded(
              child: SingleChildScrollView(
                controller: c!.scrollController.value,
                child: Obx(() {
                  return c.message.isNotEmpty
                      ? Column(
                          children: c.message
                              .map(
                                (e) => MessageWidget(
                                  e.isAdmin == 0 ? false : true,
                                  e.message,
                                  e.updatedAt,
                                ),
                              )
                              .toList(),
                        )
                      : Text("ليس هنا رسائل بعد");
                }),

                // : Text("No Messages found")),
              ),
            ),
            Container(
              height: 70,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     width: 1,
              //     color: Theme.of(context).accentColor,
              //   ),
              // ),
              // color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        // setState(() {
                        //   messages.add(
                        //     MessageWidget(false, text.text, DateTime.now()),
                        //   );
                        // });
                        await c.postMessage(text.text);
                        print("HERE");
                        text.clear();
                        c.scrollController.value.animateTo(
                          c.scrollController.value.position.maxScrollExtent +
                              100,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
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

class MessageWidget extends StatelessWidget {
  MessageWidget(this.isAdmin, this.text, this.date);
  final bool? isAdmin;
  final String? text;
  final String? date;

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
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("img/batman.png"),
        ),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                text!,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 19,
                    color: isAdmin! ? Colors.white : Color(0xFF626C75)),
              ),
              decoration: BoxDecoration(
                gradient: isAdmin!
                    ? kGColor
                    : LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xfffffffff),
                          Color(0xfffffffff),
                        ],
                      ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Text(date!.split(".")[0].split("T")[1])
          ],
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}

class ChoosAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
    );
  }
}
