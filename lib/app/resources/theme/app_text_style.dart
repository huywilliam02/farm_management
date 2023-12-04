import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';

class AppTextStyle {
  static TextStyle textTitleAppBar = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  );
  static TextStyle textTitleForm = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static TextStyle textTitleFormobligatory = GoogleFonts.roboto(
    textStyle: TextStyleConstant.red22RobotoBold,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static const textShowData = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static TextStyle textNameData = GoogleFonts.roboto(
    textStyle: TextStyleConstant.black22RobotoBold,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static TextStyle textQuantityData = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static TextStyle textPriceData = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static TextStyle textNumberData = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static const textButtonStatus = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textDateTimeData = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static TextStyle textDateTime = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static TextStyle textNameFarm = GoogleFonts.roboto(
    textStyle: TextStyleConstant.black22RobotoBold,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  static TextStyle textAddressFarm = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static TextStyle textBusinessFarm = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static TextStyle textButton = GoogleFonts.roboto(
    textStyle: TextStyleConstant.white16Roboto,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static TextStyle textRowTitle = GoogleFonts.roboto(
    textStyle: TextStyleConstant.black16Roboto,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static TextStyle textRowLabel = GoogleFonts.roboto(
    textStyle: TextStyleConstant.grey16RobotoBold,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
