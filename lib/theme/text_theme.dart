import 'package:flutter/material.dart';
import 'package:flutter_template/theme/themes.dart';

enum GPTypography {
  displayXXLarge,
  displayXLarge,
  displayLarge,
  displayMedium,
  displaySmall,
  headingXLarge,
  headingLarge,
  headingMedium,
  headingSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  bodySmallBold
}

extension TextTheme on TextStyle {
  TextStyle mergeFontSize(double size) {
    return merge(TextStyle(fontSize: size));
  }

  TextStyle mergeColor(Color color) {
    return merge(TextStyle(color: color));
  }

  TextStyle mergeFontWeight(FontWeight weight) {
    return merge(TextStyle(fontWeight: weight));
  }
}

TextStyle? textStyle(GPTypography typo) {
  switch (typo) {
    case GPTypography.displayXXLarge:
      return AppThemes.instance.textTheme.headline1;
    case GPTypography.displayXLarge:
      return AppThemes.instance.textTheme.headline2;
    case GPTypography.displayLarge:
      return AppThemes.instance.textTheme.headline3;
    case GPTypography.displayMedium:
      return AppThemes.instance.textTheme.headline4;
    case GPTypography.displaySmall:
      return AppThemes.instance.textTheme.headline5;

    case GPTypography.headingXLarge:
      return AppThemes.instance.textTheme.headline6;
    case GPTypography.headingMedium:
      return AppThemes.instance.textTheme.subtitle2;
    case GPTypography.headingLarge:
      return AppThemes.instance.textTheme.subtitle1;
    case GPTypography.headingSmall:
      return AppThemes.instance.textTheme.caption;

    case GPTypography.bodyLarge:
      return AppThemes.instance.textTheme.bodyText1;
    case GPTypography.bodyMedium:
      return AppThemes.instance.textTheme.bodyText2;
    case GPTypography.bodySmall:
      return AppThemes.instance.textTheme.overline;
    case GPTypography.bodySmallBold:
      return AppThemes.instance.textTheme.overline
          ?.mergeFontWeight(FontWeight.bold);
    default:
  }
}
