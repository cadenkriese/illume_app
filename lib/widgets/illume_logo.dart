import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IllumeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SvgPicture.asset(
      "assets/logo/illume-banner.svg",
      color: theme.colorScheme.onBackground,
      height: 30,
    );
  }
}
