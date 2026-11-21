import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_fonts.dart';

class AppStyle {
  static TextStyle interRegular25 = const TextStyle(
    fontFamily: AppFonts.kInter,
    fontWeight: FontWeight.w400,
    fontSize: 25,
    color: AppColor.kBlackColor,
  );
  static TextStyle interRegular20 = const TextStyle(
    fontFamily: AppFonts.kInter,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColor.kBlackColor,
  );
  static TextStyle interRegular12 = const TextStyle(
    fontFamily: AppFonts.kInter,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColor.kBlackColor,
  );
  static TextStyle elMessiriSemiBold25 = const TextStyle(
    fontFamily: AppFonts.kElMessiri,
    fontWeight: FontWeight.w600,
    fontSize: 25,
    color: AppColor.kBlackColor,
  );
  static TextStyle elMessiriBold30 = const TextStyle(
    fontFamily: AppFonts.kElMessiri,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: AppColor.kBlackColor,
  );
}
