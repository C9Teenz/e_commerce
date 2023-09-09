import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

Color kBlueColor = const Color(0xff38BDF8);
Color kRedColor = const Color(0xffFB7185);
Color kBlackColor = const Color(0xff000000);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kTitleColor = const Color(0xff1E293B);
Color kPrimaryColor = Colors.amber[900]!;
Color kSecondaryColor = const Color(0xff64748B);
Color kSecondaryTwoColor = const Color(0xff94A3B8);
Color kBackgroundColor = const Color(0xffF1F5F9);
Color kContainerColor = const Color(0xffF1F5F9);

TextStyle secondaryTextStyle = GoogleFonts.inter(color: kSecondaryColor);
TextStyle blueTextStyle = GoogleFonts.inter(color: kBlueColor);
TextStyle whiteTextStyle = GoogleFonts.inter(color: kWhiteColor);
TextStyle redTextStyle = GoogleFonts.inter(color: kRedColor);
TextStyle primaryTextStyle = GoogleFonts.inter(color: kPrimaryColor);
TextStyle italicTextStyle =
    GoogleFonts.inter(color: kBlueColor, fontStyle: FontStyle.italic);
TextStyle splashTextStyle = GoogleFonts.josefinSans(color: kPrimaryColor);
TextStyle titleTextStyle = GoogleFonts.josefinSans(color: kTitleColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
