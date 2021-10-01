// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GPUser _$GPUserFromJson(Map<String, dynamic> json) {
  return GPUser(
    name: json['name'] as String?,
    avatar: json['avatar'] as String?,
    type: json['type'] as String?,
    displayName: json['display_name'] as String?,
    id: json['id'] as int?,
    statusVerify: json['status_verify'] as int?,
  );
}

Map<String, dynamic> _$GPUserToJson(GPUser instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'type': instance.type,
      'id': instance.id,
      'display_name': instance.displayName,
      'status_verify': instance.statusVerify,
    };
