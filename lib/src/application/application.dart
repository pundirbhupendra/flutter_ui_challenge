import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/src/features/home/main_home_page.dart';
import '../features/features.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home:  LandingPage(),
      );
  }
}