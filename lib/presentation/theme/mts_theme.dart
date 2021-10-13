import 'package:flutter/material.dart';
import 'package:workflowz/constants/enums.dart';

abstract class MTStheme {
  Color get canvasColor;
  Color get hintColor;
  Color get accentColor;
  Color get primaryColor;
  Color get dividerColor;
  Color get errorColor;
  Color get splashColor;
  Color get cardBgColor;
  Color get primaryTextColor;
  Color get secondaryTextColor;
  Color get successColor;

  static const Color getPrimaryColor = Color(0xFFFA8E4B);
  static const List<Color> primaryGradientColors = [Color(0xFFB620E0), Color(0xFFEED810)];

  TextTheme get getSmallTextTheme => TextTheme(
        headline1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 96),
        headline2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 60),
        headline3: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 48),
        headline4: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 34),
        headline5: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 24),
        headline6: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 20),
        subtitle1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 16),
        subtitle2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 14),
        bodyText1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 16),
        bodyText2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 14),
        button: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 14),
        caption: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 15),
        overline: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, letterSpacing: 0, fontSize: 12),
      );

  TextTheme get getMediumTextTheme => TextTheme(
        headline1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 104),
        headline2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 68),
        headline3: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 56),
        headline4: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 42),
        headline5: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 32),
        headline6: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 28),
        subtitle1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 24),
        subtitle2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 22),
        bodyText1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 24),
        bodyText2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 22),
        button: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 22),
        caption: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 18),
        overline: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, letterSpacing: 0, fontSize: 18),
      );

  ThemeData getThemeData(TextTheme textTheme) => ThemeData(
        hintColor: hintColor,
        textTheme: textTheme,
        cardColor: cardBgColor,
        errorColor: errorColor,
        canvasColor: canvasColor,
        accentColor: accentColor,
        splashColor: splashColor,
        buttonColor: primaryColor,
        primaryColor: primaryColor,
        dividerColor: dividerColor,
        fontFamily: 'AvenirNextRounded',
        indicatorColor: primaryTextColor,
        disabledColor: secondaryTextColor,
        scaffoldBackgroundColor: canvasColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 8,
          valueIndicatorColor: primaryColor,
          tickMarkShape: SliderTickMarkShape.noTickMark,
          valueIndicatorTextStyle: textTheme.overline?.apply(color: Colors.white),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        timePickerTheme: TimePickerThemeData(
          dialHandColor: primaryColor,
          dialTextColor: primaryTextColor,
          dayPeriodTextColor: primaryTextColor,
          entryModeIconColor: primaryColor,
          hourMinuteTextColor: primaryTextColor,
        ),
      );

  ThemeData getTheme(DeviceScreenSize screenSize) {
    TextTheme _textTheme;

    switch (screenSize) {
      case DeviceScreenSize.Small:
        _textTheme = getSmallTextTheme;
        break;
      case DeviceScreenSize.Medium:
        _textTheme = getMediumTextTheme;
        break;
      case DeviceScreenSize.Large:
        _textTheme = getMediumTextTheme;
        break;
    }

    return getThemeData(_textTheme);
  }
}
