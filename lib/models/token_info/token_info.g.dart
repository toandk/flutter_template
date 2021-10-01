// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) {
  return TokenInfo(
    userId: json['userId'] as String?,
    workspaceId: json['workspaceId'] as String?,
    avatar: json['avatar'] as String?,
    displayName: json['displayName'] as String?,
    accessToken: json['accessToken'] as String?,
    refreshToken: json['refreshToken'] as String?,
    language: json['language'] as String?,
    environment: json['environment'] as String?,
  );
}

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'userId': instance.userId,
      'workspaceId': instance.workspaceId,
      'avatar': instance.avatar,
      'displayName': instance.displayName,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'language': instance.language,
      'environment': instance.environment,
    };
