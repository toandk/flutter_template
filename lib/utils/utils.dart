import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'log.dart';

class Utils {
  Utils._();

  static const String shortDatePattern = "hh:mm";

  static String convertDateToStringDefault(int milliseconds) {
    return DateFormat(shortDatePattern)
        .format(DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000));
  }

  static Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = "";
    try {
      if (GetPlatform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? "";
      } else if (GetPlatform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId ?? "";
      } else if (GetPlatform.isLinux) {
        var info = await deviceInfo.linuxInfo;
        deviceId = info.machineId ?? "";
      }
    } on PlatformException {
      logDebug('Failed to get platform version');
    }
    if (deviceId == "") {
      return "ABC";
    }
    return deviceId;
  }

  static String imageThumb(String pattern, String size) {
    String url = pattern.replaceAll("\$size\$", size);
    return url;
  }

  static bool isValidUrl(String? url) {
    url ??= "";
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }
}
