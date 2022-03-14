// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_course/layout/home_layout.dart';
import 'package:udemy_course/modules/bmi_calculator/bmi_calculator.dart';
import 'package:udemy_course/modules/counter/counter_screen.dart';
import 'package:udemy_course/modules/esers/esers_screen.dart';
import 'package:udemy_course/modules/home/home_screen.dart';
import 'package:udemy_course/modules/login/login_screen.dart';
import 'package:udemy_course/modules/messenger/massenger_first_screen.dart';
import 'package:udemy_course/shared/bloc_observer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayoutScreen(),
    );
  }
}
