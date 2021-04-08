import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_repo_search/styles/colors.dart';
import 'package:github_repo_search/styles/text_styles.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'SFProDisplay',
  brightness: Brightness.light,
  primaryColor: MyColors.white,
  accentColor: MyColors.accent,
  backgroundColor: MyColors.white,
  canvasColor: MyColors.white,

  // scrollbarTheme: ScrollbarThemeData(
  //   crossAxisMargin: 4,
  //   thumbColor: MaterialStateProperty<Color>(MyColors.accent),
  // ),
  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.white,
    elevation: 1,
    iconTheme: IconThemeData(
      color: MyColors.black,
      size: 16,
    ),
    titleTextStyle: appBarTextStyle,
  ),
);
