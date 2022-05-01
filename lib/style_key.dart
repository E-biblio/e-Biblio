import 'package:flutter/material.dart';
import './size_configs.dart';

Color kPrimaryColor = Color(0xff6d4c41);
Color kSecondaryColor = Color(0xffa1887f);

final kTitle = TextStyle(
  fontFamily: 'Merienda',
  fontSize: SizeConfig.blockSizeH! * 6,
  fontWeight: FontWeight.bold,
  color: Colors.brown,
);

final kBodyText1 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.5,
  letterSpacing: 0.5,
  fontWeight: FontWeight.bold,
);

final kNextSkip = TextStyle(
  color: kSecondaryColor,
  fontFamily: 'YellowTail',
  fontSize: SizeConfig.blockSizeH! * 7,
  letterSpacing: 0.5,
  fontWeight: FontWeight.bold,

);