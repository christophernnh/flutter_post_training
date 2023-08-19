import 'package:cn23_2_qualification/themes/dark_theme.dart';
import 'package:cn23_2_qualification/themes/light_theme.dart';
import 'package:cn23_2_qualification/pages/main_page.dart';
import 'package:cn23_2_qualification/pages/login_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      theme: lightTheme,
      darkTheme: darkTheme,
      home : const LoginPage(),
    );
  }
}