import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          TextButton(
            onPressed: () => showLicensePage(context: context),
            child: Text(
              "Open Source Libraries",
            ),
          ),
          TextButton(
            onPressed: () => launch(
              Uri(
                scheme: 'mailto',
                path: 'bugs@illu.me',
                queryParameters: {
                  'subject': 'illume Bug Report',
                  'body': 'Describe your bug'
                },
              ).toString(),
            ),
            child: Text(
              "Report a Bug",
            ),
          ),
          TextButton(
            onPressed: () => print('Logged out!'),
            child: Text(
              "Log Out",
            ),
          ),
        ],
      ),
    );
  }
}
