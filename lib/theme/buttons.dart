import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/theme/colors.dart';
import 'package:flutter_template/theme/text_theme.dart';

class GapoButton extends StatelessWidget {
  final double? width;

  final double height;

  final String text;

  final double borderRadius;

  final Color? backgroundColor;

  final bool disabled;

  final bool loading;

  final TextStyle? titleStyle;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  const GapoButton(
      {Key? key,
      this.width,
      this.height = 40,
      this.borderRadius = 0,
      this.backgroundColor = GPColor.bgPrimary,
      this.text = "",
      this.disabled = false,
      this.loading = false,
      required this.titleStyle,
      this.onPressed,
      this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _disableTextStyle = textStyle(GPTypography.headingMedium)
        ?.mergeColor(GPColor.contentTertiary);
    double _width = width ?? MediaQuery.of(context).size.width;

    return Container(
        width: _width,
        height: height,
        decoration: BoxDecoration(
          color: disabled ? GPColor.bgTertiary : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            const SizedBox(width: 36),
            Expanded(
              child: TextButton(
                  child: Text(text,
                      style: disabled ? _disableTextStyle : titleStyle),
                  onPressed: onPressed,
                  onLongPress: onLongPress),
            ),
            if (loading)
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 12),
                child: CircularProgressIndicator(
                  color: titleStyle?.color,
                  strokeWidth: 2,
                ),
              )
            else
              const SizedBox(width: 36)
          ],
        ));
  }
}

class AccentPrimaryButton extends GapoButton {
  AccentPrimaryButton(
    String text,
    VoidCallback? onPressed, {
    Key? key,
    double? width,
    VoidCallback? onLongPress,
    bool disabled = false,
    bool loading = false,
    double borderRadius = 0,
    double height = 40,
  }) : super(
            key: key,
            height: height,
            disabled: disabled,
            loading: loading,
            borderRadius: borderRadius,
            backgroundColor: GPColor.functionAccentPrimary,
            text: text,
            titleStyle: textStyle(GPTypography.headingMedium)
                ?.mergeColor(GPColor.contentInversePrimary),
            onPressed: onPressed,
            onLongPress: onLongPress);
}

class AccentSecondaryButton extends GapoButton {
  AccentSecondaryButton(
    String text,
    VoidCallback? onPressed, {
    Key? key,
    double? width,
    VoidCallback? onLongPress,
    bool disabled = false,
    bool loading = false,
    double borderRadius = 0,
    double height = 40,
  }) : super(
            key: key,
            height: height,
            disabled: disabled,
            loading: loading,
            borderRadius: borderRadius,
            backgroundColor: GPColor.functionAccentSecondary,
            text: text,
            titleStyle: textStyle(GPTypography.headingMedium)
                ?.mergeColor(GPColor.functionAccentPrimary),
            onPressed: onPressed,
            onLongPress: onLongPress);
}

class AccentWorkPrimaryButton extends GapoButton {
  AccentWorkPrimaryButton(
    String text,
    VoidCallback? onPressed, {
    Key? key,
    double? width,
    VoidCallback? onLongPress,
    bool disabled = false,
    bool loading = false,
    double borderRadius = 0,
    double height = 40,
  }) : super(
            key: key,
            height: height,
            disabled: disabled,
            loading: loading,
            borderRadius: borderRadius,
            backgroundColor: GPColor.functionAccentWorkPrimary,
            text: text,
            titleStyle: textStyle(GPTypography.headingMedium)
                ?.mergeColor(GPColor.contentInversePrimary),
            onPressed: onPressed,
            onLongPress: onLongPress);
}

class BgPrimaryButton extends GapoButton {
  BgPrimaryButton(
    String text,
    VoidCallback? onPressed, {
    Key? key,
    double? width,
    VoidCallback? onLongPress,
    bool disabled = false,
    bool loading = false,
    double borderRadius = 0,
    double height = 40,
  }) : super(
            key: key,
            height: height,
            disabled: disabled,
            loading: loading,
            borderRadius: borderRadius,
            backgroundColor: GPColor.bgPrimary,
            text: text,
            titleStyle: textStyle(GPTypography.headingMedium)
                ?.mergeColor(GPColor.contentPrimary),
            onPressed: onPressed,
            onLongPress: onLongPress);
}

class BgSecondaryButton extends GapoButton {
  BgSecondaryButton(
    String text,
    VoidCallback? onPressed, {
    Key? key,
    double? width,
    VoidCallback? onLongPress,
    bool disabled = false,
    bool loading = false,
    double borderRadius = 0,
    double height = 40,
  }) : super(
            key: key,
            height: height,
            disabled: disabled,
            loading: loading,
            borderRadius: borderRadius,
            backgroundColor: GPColor.bgSecondary,
            text: text,
            titleStyle: textStyle(GPTypography.headingMedium)
                ?.mergeColor(GPColor.contentPrimary),
            onPressed: onPressed,
            onLongPress: onLongPress);
}

class NegativeSecondaryButton extends GapoButton {
  NegativeSecondaryButton(
    String text,
    VoidCallback? onPressed, {
    Key? key,
    double? width,
    VoidCallback? onLongPress,
    bool disabled = false,
    bool loading = false,
    double borderRadius = 0,
    double height = 40,
  }) : super(
            key: key,
            height: height,
            disabled: disabled,
            loading: loading,
            borderRadius: borderRadius,
            backgroundColor: GPColor.functionNegativeSecondary,
            text: text,
            titleStyle: textStyle(GPTypography.headingMedium)
                ?.mergeColor(GPColor.functionNegativePrimary),
            onPressed: onPressed,
            onLongPress: onLongPress);
}
