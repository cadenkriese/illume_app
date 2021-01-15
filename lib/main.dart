import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:illume_app/screens/home/home.dart';
import 'package:illume_app/theme.dart';

void main() {
  runApp(IllumeApp());
}

class IllumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO add google fonts licenses to registry.
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    return MaterialApp(
      title: 'illume',
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
