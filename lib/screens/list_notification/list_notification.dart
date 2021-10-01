import 'package:flutter/material.dart';
import 'package:flutter_template/configs/constants.dart';
import 'package:flutter_template/generated/locales.g.dart';
import 'package:flutter_template/screens/list_notification/notification_item.dart';
import 'package:flutter_template/theme/colors.dart';
import 'package:flutter_template/theme/text_theme.dart';
import 'package:flutter_template/widgets/back_button.dart';
import 'package:get/get.dart';
import 'list_notification_controller.dart';

class ListNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListNotificationController());
  }
}

class ListNotificationScreen extends GetView<ListNotificationController> {
  const ListNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          leading: const GPBackButton(),
          title: Text(LocaleKeys.task_notificationTitle.tr,
              style: textStyle(GPTypography.headingLarge)),
        ),
        body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent -
                      Constants.kLoadMoreOffset) {
                controller.loadMoreItems();
              }
              return true;
            },
            child: Obx(() => ListView.separated(
                itemBuilder: (context, index) =>
                    NotificationItem(notification: controller.listItem[index]),
                separatorBuilder: (context, index) {
                  return const Divider(height: 0.5, color: GPColor.linePrimary);
                },
                itemCount: controller.listItem.length))));
  }
}
