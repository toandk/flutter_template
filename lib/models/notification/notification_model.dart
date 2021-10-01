import 'package:flutter_template/generated/locales.g.dart';
import 'package:flutter_template/models/gpuser.dart';
import 'package:flutter_template/models/text_part.dart';
import 'package:flutter_template/utils/utils.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: "id")
  String? id;

  int? type, status;

  @JsonKey(name: "workspace_id")
  String? workspaceId;

  @JsonKey(name: "task_status")
  int? taskStatus;

  @JsonKey(name: "task_title")
  String? taskTitle;

  @JsonKey(name: "task_id")
  String? taskId;

  @JsonKey(name: "from_user")
  GPUser? fromUser;

  @JsonKey(name: "target_user")
  GPUser? targetUser;

  @JsonKey(name: "created_at")
  int? createdAt;

  @JsonKey(name: "updated_at")
  int? updatedAt;

  NotificationModel(
      {this.id,
      this.workspaceId,
      this.taskStatus,
      this.taskTitle,
      this.taskId,
      this.fromUser,
      this.targetUser,
      this.createdAt,
      this.updatedAt});

  factory NotificationModel.fromJson(Map<String, dynamic> data) =>
      _$NotificationModelFromJson(data);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  String timeAgo() {
    return Utils.convertDateToStringDefault(updatedAt ?? 0);
  }

  bool isRead() {
    return status == 1;
  }

  String getMessage() {
    switch (type) {
      case 0:
        return LocaleKeys.notification_addAssignee.tr
            .replaceFirst("%", fromUser?.displayName ?? "")
            .replaceFirst("%", targetUser?.displayName ?? "");
      case 1:
        return LocaleKeys.notification_addWatcher.tr
            .replaceFirst("%", fromUser?.displayName ?? "")
            .replaceFirst("%", targetUser?.displayName ?? "");
      case 2:
        return LocaleKeys.notification_edittedTask.tr
            .replaceFirst("%", fromUser?.displayName ?? "");
      case 3:
        return LocaleKeys.notification_updatedDueDate.tr
            .replaceFirst("%", fromUser?.displayName ?? "");
      case 4:
        return LocaleKeys.notification_deletedTask.tr
            .replaceFirst("%", fromUser?.displayName ?? "");
      default:
        return "";
    }
  }

  List<TextPart> getTextParts() {
    final texts = [
      LocaleKeys.notification_addAssignee.tr,
      LocaleKeys.notification_addWatcher.tr,
      LocaleKeys.notification_edittedTask.tr,
      LocaleKeys.notification_updatedDueDate.tr,
      LocaleKeys.notification_deletedTask.tr
    ];
    final type = this.type ?? 0;
    String text = type < texts.length ? texts[type] : "";
    List<TextPart> list = [];
    final comps = text.split("%");
    for (int i = 0; i < comps.length; i++) {
      if (comps[i].isNotEmpty) {
        if (i != 1) {
          list.add(TextPart(text: targetUser?.displayName ?? "", type: 1));
        } else {
          list.add(TextPart(text: fromUser?.displayName ?? "", type: 1));
        }
        list.add(TextPart(text: comps[i], type: 0));
      }
    }
    if (comps.last.isEmpty) {
      list.add(TextPart(text: targetUser?.displayName ?? "", type: 1));
    }
    return list;
  }
}
