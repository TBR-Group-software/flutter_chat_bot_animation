import 'package:flutter/material.dart';

import 'colors.dart';
import 'gen/fonts.gen.dart';

abstract class ProjectTextStyle {
  static const _chivoFontFamily = ProjectFontFamily.chivo;
  static const _comfortaaFontFamily = ProjectFontFamily.comfortaa;
  static const _monserratFontFamily = ProjectFontFamily.montserrat;

  static const chivoRegular10DarkGrey = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: ProjectColors.darkGray,
  );

  static const chivoRegular12White = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const chivoRegular13LightGrey = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ProjectColors.lightGrey,
  );

  static const chivoRegular14White = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static const chivoRegular14LightGrey = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ProjectColors.lightGrey,
  );

  static const chivoRegular14CharcoalGrey = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ProjectColors.charcoalGrey,
  );

  static const chivoRegular16White = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const chivoRegular16SoftGrey = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ProjectColors.softGrey,
  );

  static const chivoLight16CharcoalGrey = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: ProjectColors.charcoalGrey,
  );

  static const chivoRegular16CharcoalGrey = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ProjectColors.charcoalGrey,
  );

  static const chivoRegular16ElectricBlue = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ProjectColors.electricBlue,
  );

  static const chivoHeavy16White = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static const chivoRegular20White = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const chivoRegular36White = TextStyle(
    fontFamily: _chivoFontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const comfortaaMedium24White = TextStyle(
    fontFamily: _comfortaaFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const monserratRegular20Black = TextStyle(
    fontFamily: _monserratFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
