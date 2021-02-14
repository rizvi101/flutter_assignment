import 'package:flutter/material.dart';

import 'Screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle().copyWith(
            fontSize: 20,
          ),
        ),
      ),
      home: ProfileScreen(),
    );
  }
}
