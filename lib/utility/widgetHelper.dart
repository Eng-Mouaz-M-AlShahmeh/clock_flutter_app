/* Developed by Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
double getDimension(context, double unit){
  if(fullWidth(context) <= 360.0){
    return unit / 1.3;
  }
  else {
    return unit;
  }
}

ThemeData customTheme(BuildContext context){
  return  Theme.of(context).brightness == Brightness.light
      ? Theme.of(context).copyWith(
    // Hour hand.
    primaryColor: const Color(0xff65865e),
    // Minute hand.
    highlightColor: const Color(0xff90bb91),
    backgroundColor: const Color(0xfff1f3f6), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
  )
      : Theme.of(context).copyWith(
    primaryColor: const Color(0xFFD2E3FC),
    highlightColor: const Color(0xFF54F442),
    backgroundColor: const Color(0xFFe3edf7),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(
        0xFF8AF890)),
  );
}

BoxDecoration decoration(BuildContext context,{BoxShape shape = BoxShape.circle}){
  return  BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(blurRadius: 20,offset: const Offset(10, 10),color: const Color(
            0xff3baa37).withAlpha(25),spreadRadius:5),
        const BoxShadow(blurRadius: 20,offset: Offset(-10,-10),color: Color(0xaaffffff),spreadRadius:5),
        BoxShadow(blurRadius: 4,offset: const Offset(2,2),color: const Color(0xaaffffff).withAlpha(125),spreadRadius:1)
      ],
      color: const Color(0xfff1f3f6),
      shape: shape
  );
}

BoxDecoration decorationDigits(BuildContext context,{BoxShape shape = BoxShape.rectangle}){
  return  BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(blurRadius: 20,offset: const Offset(10, 10),color: const Color(
            0xff37aa3d).withAlpha(25),spreadRadius:5),
        const BoxShadow(blurRadius: 20,offset: Offset(-10,-10),color: Color(0xaaffffff),spreadRadius:5),
        BoxShadow(blurRadius: 4,offset: const Offset(2,2),color: const Color(0xaaffffff).withAlpha(125),spreadRadius:1)
      ],
      color: const Color(0xffcbcad3),
      shape: shape
  );
}