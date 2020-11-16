import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wikipedia_app/values/colors.dart';
import 'package:wikipedia_app/values/fonts.dart';

import 'dimens.dart';

final TextStyle styleNormalRegularBlack = TextStyle(
    color: textColorBlack,
    fontSize: fontTextSmall,
    fontFamily: sanFranciscoRegular);

final TextStyle styleRegularBlue = GoogleFonts.montserrat(
    color: Color.fromRGBO(6, 69, 173, 1),
    fontSize: 18,
    fontWeight: FontWeight.w500);

final TextStyle styleRegularLightGreen = GoogleFonts.montserrat(
  color: textColorLightGreen,
  fontWeight: FontWeight.w300,
  fontSize: 14.0,
);

final TextStyle styleTextLoading = TextStyle(
  color: loadingColor,
  fontSize: fontTextBig,
  fontFamily: sanFranciscoRegular,
);
final TextStyle styleTextTitle = TextStyle(
  color: textColorBlack,
  fontSize: fontTextBig,
  fontFamily: sanFranciscoBold,
);
