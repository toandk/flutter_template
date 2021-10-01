import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/utils/log.dart';
import 'package:get/get.dart';

class GPBackButton extends StatelessWidget {
  const GPBackButton({Key? key}) : super(key: key);

  void _onBack() {
    logDebug("back ${Get.previousRoute} ${Get.currentRoute}");
    if (Get.previousRoute == Get.currentRoute || Get.previousRoute.isEmpty) {
      SystemNavigator.pop(animated: true);
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: _onBack,
        icon: Image.asset("assets/images/ic24-line20-arrowleft.png"));
  }
}
