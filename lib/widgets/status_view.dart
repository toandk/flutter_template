import 'package:flutter/material.dart';
import 'package:flutter_template/theme/colors.dart';

class StatusView extends StatelessWidget {
  final int status;
  const StatusView({Key? key, required this.status}) : super(key: key);

  static const colors = [
    GPColor.functionCriticalPrimary,
    Color(0xff1A99F4),
    GPColor.functionAccentWorkSecondary
  ];

  static const bgColors = [
    GPColor.bgTertiary,
    GPColor.functionPositiveSecondary,
    GPColor.functionAccentWorkSecondary,
  ];

  static const borderColors = [
    GPColor.linePrimary,
    GPColor.functionAccentWorkSecondary,
    GPColor.functionAccentWorkSecondary,
  ];

  bool get isCompletedStatus => status == 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColors[status],
        border: Border.all(
          color: borderColors[status],
          // hide the border
          width: isCompletedStatus ? 0 : 1,
        ),
      ),
      child: isCompletedStatus
          ? Image.asset(
              "assets/images/ic_status_tick.png",
              width: 10,
              height: 10,
            )
          : const SizedBox(),
    );
  }
}
