import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_template/generated/locales.g.dart';
import 'package:flutter_template/utils/log.dart';

abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  void handleError(Object error) {
    logDebug("got error ${error.toString()}");
    isLoading.value = false;
    if (error is Exception) {
      Get.snackbar(LocaleKeys.alert_alert, error.toString());
    } else {
      Get.snackbar(LocaleKeys.alert_alert, error.toString());
    }
  }
}

abstract class BaseListController<T> extends BaseController {
  bool canLoadMore = true;
  String nextLink = "";
  RxBool showEmptyState = false.obs;
  RxList<T> listItem = RxList<T>();

  RxString errorStr = "".obs;

  bool get isSuccessState => listItem.length > 0;

  bool get isLoadingState => isLoading.value && errorStr.isEmpty;

  bool get isErrorState => errorStr.isNotEmpty;

  Future getListItems() async {
    if (isLoading.value) return;
    isLoading.value = true;
    errorStr.value = "";
    // Call API here
  }

  Future loadMoreItems() async {
    if (!canLoadMore || isLoading.value) return;
    await getListItems();
  }

  Future reload() async {
    nextLink = "";
    await getListItems();
  }

  void handleResponse(List<T> items, String? nextLink) {
    isLoading.value = false;

    bool isReload = this.nextLink.isEmpty;
    canLoadMore = nextLink?.isEmpty == false && items.isNotEmpty;
    this.nextLink = nextLink ?? "";
    _checkEmptyState(items, isReload);
    buildListItem(items, isReload);
  }

  void buildListItem(List<T> items, bool isReload) {
    if (isReload) {
      listItem.value = items;
    } else {
      listItem.addAll(items);
    }
  }

  void _checkEmptyState(List<T> items, bool isReload) {
    if (isReload && items.isEmpty) {
      showEmptyState.value = true;
    }
  }
}
