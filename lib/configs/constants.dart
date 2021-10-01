import 'package:flutter_template/models/token_info/token_info.dart';

enum Environment { staging, production }

Environment env = Environment.staging;

class Constants {
  static TokenInfo _tokenInfo = TokenInfo(
      userId: "1042179540",
      workspaceId: "581860791816317",
      displayName: "Do Khanh Toan",
      accessToken:
          "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImp0aSI6IjYzNTExMjAzMi40MjRlYzk2MC04ZDhkLTQzMTEtYWZlZS0wYTA0Y2Q0MGU5NjguMTYzMjk5OTc4MSJ9.eyJpc3MiOiJnYXBvLnZuIiwiYXVkIjoiaW9zLmdhcG8udm4iLCJqdGkiOiI2MzUxMTIwMzIuNDI0ZWM5NjAtOGQ4ZC00MzExLWFmZWUtMGEwNGNkNDBlOTY4LjE2MzI5OTk3ODEiLCJpYXQiOjE2MzI5OTk3NzEsIm5iZiI6MTYzMjk5OTc3MSwidWlkIjo2MzUxMTIwMzIsImV4cCI6MTYzMzE3MjU3MX0.U2gvnhElS7niAhAIhpnSAtGv2Y-mvZoJZxiCCX31XvETshbA7rVNNEtuVs6OWj3mtyLeY9Hyc1sCRcRr5Eckbycev3u0luGhd4V7zZw8jRU9_z7JevyvhDI3SwHmtyOMP_UydzRPwwp5neQhdbD6sK1h_iIF1o3J0fhoJwqJl21DjuTEwyv19lLiTjp6gzYDYG_EqvE9J4NQatvU1VuFhoy9flHNTHIAB2GuaBq0KSph53i6EqqGEh4mx38tqT-yD5q0geNnXnqSN7QBlRa8w_z4qeB6xpRwEBfq7sAyhT2AMAQol82xuadF9nraIXLDueuyHuY4kktiM2YK2CgXOQ");

  /// APP CONFIG
  static const String tokenStringKey = "access_token";

  static String defaultTaskId = "";

  static const double kLoadMoreOffset = 100;

  /// CUSTOM CONFIG APP
  static const String languageKey = 'LANGUAGE';

  static String apiDomain = env == Environment.staging
      ? "https://staging-api.gapowork.vn"
      : 'https://api.gapowork.vn';

  static String taskDomain = env == Environment.staging
      ? "https://staging-api.gapowork.vn/mini-task/v1.0"
      : 'https://api.gapowork.vn/mini-task/v1.0';

  static void updateTokenInfo(TokenInfo tokenInfo) {
    _tokenInfo = tokenInfo;
  }

  static String accessToken() {
    return _tokenInfo.accessToken ?? "";
  }

  static String workspaceId() {
    return _tokenInfo.workspaceId ?? "";
  }

  static String userId() {
    return _tokenInfo.userId ?? "";
  }

  static String displayName() {
    return _tokenInfo.displayName ?? "";
  }

  static String language() {
    return _tokenInfo.language ?? "";
  }

  static Environment environment() {
    return _tokenInfo.environment == "staging"
        ? Environment.staging
        : Environment.production;
  }
}
