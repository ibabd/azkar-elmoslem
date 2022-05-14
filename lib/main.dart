// ignore_for_file: deprecated_member_use

import 'package:azkar_elmoslem/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            textTheme: TextTheme(
                subtitle1: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 22.0,
                )
            ),
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
      ),
      home: const HomeScreen(),

    );
  }
}
