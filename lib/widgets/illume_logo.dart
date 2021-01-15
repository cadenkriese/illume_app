import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IllumeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      children: [
        SvgPicture.asset(
          "assets/logo/illume-logo-horizontal.svg",
          color: theme.colorScheme.onBackground,
          height: 20,
        )
      ],
    );
  }
}
