import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Model/chat.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  //
  RxList<Message> message = <Message>[].obs;
  //
  Rx<ScrollController> scrollController = ScrollController().obs;
  //
  Timer? _timer;
  //
  RxBool isLoading = true.obs;
  //
  RxBool isEmpty = false.obs;

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
      print("fetch Messages");
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
    // isLoading.value = true;
    RxList<Message> temp = await ApiService.fetchMessage();
    if (temp.length == 0) {
      isEmpty.value = true;
      isLoading.value = false;
    }

    if (temp.length > message.length) {
      isLoading.value = false;
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
  Future postMessage(String? message) async {
    await ApiService.postMessage(message);
  }
}
