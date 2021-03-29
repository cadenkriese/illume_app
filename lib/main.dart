import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illume_app/data/mock_data_provider.dart';
import 'package:illume_app/screens/account/account.dart';
import 'package:illume_app/screens/home/home.dart';
import 'package:illume_app/theme.dart';

void main() {
  runApp(IllumeApp());
}

class IllumeApp extends StatefulWidget {
  @override
  _IllumeAppState createState() => _IllumeAppState();
}

class _IllumeAppState extends State<IllumeApp> {
  int _index = 0;
  // final Map<Widget, GlobalKey> _pages = {};
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(Home());
    _pages.add(Account(kMockUsers[0]));

    // _pages.add(Navigator(key: GlobalKey<NavigatorState>()));
    // _pages.add(Navigator(
    //   initialRoute: "/",
    //   key: GlobalKey<NavigatorState>(),
    //   onGenerateRoute: (routeSettings) {
    //     return MaterialPageRoute(
    //       builder: (context) => routeBuilders[routeSettings.name](context),
    //     );
    //   },
    // ));

    // _pages[Home()] = GlobalKey<NavigatorState>();
    // _pages[Account(kMockUsers[0])] = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'illume',
      debugShowCheckedModeBanner: false,
      theme: IllumeThemeData.lightThemeData,
      darkTheme: IllumeThemeData.darkThemeData,
      home: Scaffold(
        body: IndexedStack(
          index: _index,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => _index = index),
          currentIndex: _index,
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
