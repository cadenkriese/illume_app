import 'package:flutter/material.dart';
import 'package:illume_app/widgets/illume_logo.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(title: IllumeLogo(),
     actions: [
      IconButton(
          onPressed: () {
            // TODO Consider how to add posts.
          },
          //TODO fix centering somehow
          icon: Icon(Icons.add_circle_outline_rounded)
          //TODO switch to custom icons.
          // child: SvgPicture.asset(
          //   // TODO make a local icons package
          //   "assets/icon/add.svg",
          //   //TODO use theme colors
          //   color: CupertinoColors.activeBlue,
          //   //TODO use lang
          //   semanticsLabel: 'Add to feed.',
          // ),
          ),
    ]);
  }
}
