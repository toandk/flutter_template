import 'package:flutter_template/screens/list_notification/list_notification.dart';
import 'package:get/get.dart';

import 'router_name.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(
        name: RouterName.notifications,
        transitionDuration: Duration.zero,
        page: () => const ListNotificationScreen(),
        binding: ListNotificationBinding()),
  ];
}
