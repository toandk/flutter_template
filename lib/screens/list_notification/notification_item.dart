import 'package:flutter/material.dart';
import 'package:flutter_template/models/notification/notification_model.dart';
import 'package:flutter_template/theme/colors.dart';
import 'package:flutter_template/theme/text_theme.dart';
import 'package:flutter_template/widgets/status_view.dart';
import 'package:get/get.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  List<TextSpan> _getMessageSpans() {
    final textParts = notification.getTextParts();
    final normalStyle = textStyle(GPTypography.bodyMedium)
        ?.mergeColor(GPColor.contentSecondary);
    final boldStyle = normalStyle?.mergeFontWeight(FontWeight.bold);
    List<TextSpan> spans = [];
    for (int i = 0; i < textParts.length; i++) {
      final span = TextSpan(
          text: textParts[i].text,
          style: textParts[i].type == 0 ? normalStyle : boldStyle);
      spans.add(span);
    }
    return spans;
  }

  void _openNotification() {
    // Get.toNamed(RouterName.taskCreate,
    //     arguments: {"taskId": notification.taskId});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: notification.isRead()
            ? GPColor.functionPositiveSecondary
            : GPColor.bgPrimary,
        padding: const EdgeInsets.fromLTRB(17, 12, 16, 12),
        child: InkWell(
            onTap: _openNotification,
            child: Row(
              children: [
                Expanded(
                    child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 12,
                        leading:
                            StatusView(status: notification.taskStatus ?? 0),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(notification.taskTitle ?? "",
                                style: textStyle(GPTypography.headingMedium),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                            const SizedBox(height: 4),
                            RichText(
                                text: TextSpan(children: _getMessageSpans()))
                          ],
                        ))),
                const SizedBox(width: 12),
                Text(
                  notification.timeAgo(),
                  style: textStyle(GPTypography.bodySmall)
                      ?.mergeColor(GPColor.contentSecondary),
                )
              ],
            )));
  }
}
