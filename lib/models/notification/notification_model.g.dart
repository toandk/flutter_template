// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel(
    id: json['id'] as String?,
    workspaceId: json['workspace_id'] as String?,
    taskStatus: json['task_status'] as int?,
    taskTitle: json['task_title'] as String?,
    taskId: json['task_id'] as String?,
    fromUser: json['from_user'] == null
        ? null
        : GPUser.fromJson(json['from_user'] as Map<String, dynamic>),
    targetUser: json['target_user'] == null
        ? null
        : GPUser.fromJson(json['target_user'] as Map<String, dynamic>),
    createdAt: json['created_at'] as int?,
    updatedAt: json['updated_at'] as int?,
  )
    ..type = json['type'] as int?
    ..status = json['status'] as int?;
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'workspace_id': instance.workspaceId,
      'task_status': instance.taskStatus,
      'task_title': instance.taskTitle,
      'task_id': instance.taskId,
      'from_user': instance.fromUser,
      'target_user': instance.targetUser,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
