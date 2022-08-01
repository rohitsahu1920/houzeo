import 'package:flutter/material.dart';
import 'package:houzeo/res/sizes.dart';
import 'package:houzeo/res/textstyles.dart';
import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  iconTheme: IconThemeData(size: Sizes.s20, color: Colors.black),
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  primaryColorLight: AppColors.primaryLightColor,
  primaryColorDark: AppColors.primary,
  //accentColor: AppColors.primaryLightColor,
  //accentColorBrightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomAppBarColor: AppColors.primaryLightColor,
  cardColor: Colors.white,
  dividerColor: Colors.black,
  splashFactory: InkSplash.splashFactory,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  fontFamily: FontFamily.regular,
);