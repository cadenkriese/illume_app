import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('Home'),
            child: Home(),
          ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
