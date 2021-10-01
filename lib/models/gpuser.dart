import 'package:json_annotation/json_annotation.dart';
part 'gpuser.g.dart';

@JsonSerializable()
class GPUser {
  String? name, avatar, type;
  int? id;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "status_verify")
  int? statusVerify;

  GPUser(
      {this.name,
      this.avatar,
      this.type,
      this.displayName,
      required this.id,
      this.statusVerify});

  factory GPUser.fromJson(Map<String, dynamic> data) => _$GPUserFromJson(data);

  Map<String, dynamic> toJson() => _$GPUserToJson(this);
}
