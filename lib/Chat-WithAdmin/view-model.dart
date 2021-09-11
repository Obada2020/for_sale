import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Chat-WithAdmin/model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  //
  RxList<Message> message = <Message>[].obs;
  //
  Rx<ScrollController> scrollController = ScrollController().obs;
  //
  Timer? _timer;
  
  //
  @override
  void dispose() {
    _timer!.cancel();
    print("Dispose");
    super.dispose();
  }
  //

  //
  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
      await fetchMessages();
    });
  }

  //
  //
  @override
  void onClose() {
    _timer!.cancel();
    //THIS IS NEVER HIT
    super.onClose();
  }

  //
  Future fetchMessages() async {
    RxList<Message> temp = await ApiService.fetchMessage(1);
    if (temp.length > message.length) {
      message.value = temp;
      scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent + 100,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
  //

  //
  Future postMessage(int? account, String? message) async {
    await ApiService.postMessage(account, message);
  }
}
