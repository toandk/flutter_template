import 'package:flutter_template/configs/constants.dart';
import 'package:flutter_template/models/base/list_api_response.dart';
import 'package:flutter_template/models/notification/notification_model.dart';

import 'api.dart';

class TaskAPI {
  final ApiService _service = ApiService(Constants.taskDomain);

  Future<ListAPIResponse<NotificationModel>> getListNotification(
      {String nextLink = "", int limit = 10}) async {
    var params = {
      "workspace_id": Constants.workspaceId(),
      "limit": limit.toString()
    };
    if (nextLink.isNotEmpty) params.addAll(Uri.splitQueryString(nextLink));
    final response =
        await _service.getData(endPoint: "/notifications", query: params);
    ListAPIResponse<NotificationModel> result =
        ListAPIResponse.fromJson(response);
    return result;
  }
}
