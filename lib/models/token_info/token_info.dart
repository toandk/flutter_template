import 'package:json_annotation/json_annotation.dart';
part 'token_info.g.dart';

@JsonSerializable()
class TokenInfo {
  String? userId,
      workspaceId,
      avatar,
      displayName,
      accessToken,
      refreshToken,
      language,
      environment;

  TokenInfo(
      {this.userId = "",
      this.workspaceId = "",
      this.avatar = "",
      this.displayName = "",
      this.accessToken = "",
      this.refreshToken = "",
      this.language = "vi",
      this.environment = "staging"});

  factory TokenInfo.fromJson(Map<String, dynamic> data) =>
      _$TokenInfoFromJson(data);

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}
