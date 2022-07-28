import 'dart:ui';

import 'package:flutter/material.dart';

import 'ThemeColors.dart';

TextStyle bannerTextStyle(){
  return const TextStyle(
      color: ThemeColors.mainColor,
      fontFamily: 'Montserrat',
      fontSize: 34.0,
      height: 0.5);
}

TextStyle landingProductText(){
  return const TextStyle(
      color: ThemeColors.mainColor,
      fontFamily: 'Montserrat',
      fontSize: 14.0,
      );
}

TextStyle landingPriceText(){
  return const TextStyle(
    color: ThemeColors.mainColor,
    fontFamily: 'Montserrat',
    fontSize: 14.0, fontWeight: FontWeight.bold,
  );
}

TextStyle drawerHeaderTextStyle(){
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 16.0);
}

TextStyle bottomMenuText(){
  return const TextStyle(
      color: ThemeColors.mainColor,
      fontFamily: 'Montserrat',
      fontSize: 30.0,
      height: 0.5,
      fontWeight: FontWeight.bold);
}

TextStyle versionStyle(){
  return const TextStyle(
      color: Colors.black87,
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 16.0);
}