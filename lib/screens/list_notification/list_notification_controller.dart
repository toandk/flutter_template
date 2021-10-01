import 'package:flutter_template/base/controller/base_controller.dart';
import 'package:flutter_template/base/networking/task_api.dart';
import 'package:flutter_template/configs/constants.dart';
import 'package:flutter_template/utils/log.dart';

class ListNotificationController extends BaseListController {
  TaskAPI api = TaskAPI();

  @override
  void onInit() {
    super.onInit();
    getListItems();
  }

  @override
  Future getListItems() async {
    if (isLoading.value || Constants.accessToken().isEmpty) return;
    isLoading.value = true;
    try {
      var response = await api.getListNotification(nextLink: nextLink);
      handleResponse(response.data, response.links.next);
    } catch (error) {
      logDebug("get list error $error");
      handleError(error);
    }
    update();
  }
}
