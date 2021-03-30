# 💡 illume
### The next generation of work from home.

illume is a new professional social media app for connecting with people who work from home.

*Created by Caden Kriese and CJ Braccia as a part of the 2021 Future Business Leaders of America Mobile App competition.*

## Installation

 - Follow the guide on https://flutter.dev/docs/get-started/install to install the Flutter framework.

 - Install the [iOS Simulator](https://apps.apple.com/us/app/xcode/id497799835?mt=12) or [Android Emulator](https://developer.android.com/studio/run/emulator) to run the application. 
    - Note you can use a physical device but for iOS devices you must set up a signing profile and provisioning profile in XCode which becomes complicated quickly unless you subscribe to the Apple developer program.

## Running

 - Open code repository and execute `flutter run` in your systems command-line to run the app on an available simulator emulator or physical device.

## Code

 - The projects code files are in the lib directory, as is standard with Flutter projects. The iOS and Android directories contain platform specific build but no custom code.

 - Inside of the lib directory we've used the BLoC package, to isolate our business logic code from our UI and simple state management code. For more information about the app structure we use, see [this article](https://hackernoon.com/scalable-app-structure-in-flutter-dad61a4bc389).

 - Each app screen is isolated and the widgets (ui building blocks in Flutter) that it uses are in the same folders.

 - The app theme data is contained in theme.dart in the base lib directory, and the application entry point is in main.dart.

 - For a list of all of the open-source packages we used to build this app you can see the pubspec.yaml file, to read more details about each package you can search them up on (https://pub.dev).

