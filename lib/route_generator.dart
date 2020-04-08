import 'package:flutter/material.dart';
import 'package:wikaya/autorisation.dart';
import 'package:wikaya/home.dart';
import 'welcom.dart';
import 'package:wikaya/phone_verif.dart';
import 'code.dart';
import 'phone_verif.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => Wlc());
    } else if (settings.name == '/phone') {
      return MaterialPageRoute(builder: (_) => Phone());
    } else if (settings.name == '/auto') {
      return MaterialPageRoute(builder: (_) => Auto());
    } else if (settings.name == '/home') {
      return MaterialPageRoute(builder: (_) => Home());
    } else if (settings.name == '/code') {
      return MaterialPageRoute(builder: (_) => Code());
    }
  }
}
