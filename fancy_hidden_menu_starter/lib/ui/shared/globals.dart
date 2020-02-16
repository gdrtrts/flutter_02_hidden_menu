import 'dart:ui';
import 'package:flutter/material.dart';

abstract class Global {
  static const Color lightBlue = const Color(0xffdee6f3);
  static const Color darkBlue = const Color(0xff4A64FE);
  static const Color blue = const Color(0xff1c2a7f);
  static const Color lightBlack = const Color(0xff201F22);
  static const Color white = const Color(0xffffffff);
  static const Color lightGrey = const Color(0xfff1f3f6);
  static const Color mediumGrey = const Color(0xffe5e7ea);
  static const Color darkGrey = const Color(0xffa3a6a9);

  static final globalKey = GlobalKey<AnimatedListState>();

  static final List<Map> menuItems = [
    {
      'name': 'Lights',
      'icon': Icons.lightbulb_outline,
    },
    {
      'name': 'Aircon',
      'icon': Icons.ac_unit,
    },
    {
      'name': 'Heating',
      'icon': Icons.whatshot,
    },
    {
      'name': 'Speakers',
      'icon': Icons.speaker,
    },
    {
      'name': 'Fridge',
      'icon': Icons.crop_square,
    },
    {
      'name': 'Calendar',
      'icon': Icons.calendar_today,
    },
  ];
}
