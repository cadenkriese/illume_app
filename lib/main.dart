import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illume_app/screens/account/account.dart';
import 'package:illume_app/screens/home/home.dart';
import 'package:illume_app/theme.dart';

void main() {
  runApp(IllumeApp());
}

class IllumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'illume',
      debugShowCheckedModeBanner: false,
      theme: IllumeThemeData.lightThemeData,
      darkTheme: IllumeThemeData.darkThemeData,
      home: Scaffold(
        body: Account(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: "Account",
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
