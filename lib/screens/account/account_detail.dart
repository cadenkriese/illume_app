import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:illume_app/data/user.dart';

class AccountDetail extends StatelessWidget {
  final User _user;
  const AccountDetail(this._user);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double cardWidth = MediaQuery.of(context).size.width / 4;

    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          theme.colorScheme.secondary,
          theme.colorScheme.secondaryVariant,
        ],
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 16,
          offset: Offset(0, 12),
          color: theme.colorScheme.secondary.withOpacity(0.3),
        ),
        BoxShadow(
          blurRadius: 16,
          offset: Offset(0, 14),
          color: theme.colorScheme.secondaryVariant.withOpacity(0.3),
        ),
      ],
    );

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(backgroundImage: _user.photo, radius: 40),
          Text(
            _user.name,
            style: theme.textTheme.headline1,
            //TODO change to pure white or black color
          ),
          Text(
            "Florence Office",
            style: theme.textTheme.subtitle1,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: cardWidth / 4),
              SizedBox(
                width: cardWidth,
                height: cardWidth * 1.1,
                child: DecoratedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1.2K",
                        style: theme.textTheme.headline1,
                      ),
                      Text(
                        "Links",
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                  decoration: boxDecoration,
                ),
              ),
              SizedBox(width: cardWidth / 4),
              SizedBox(
                width: cardWidth,
                height: cardWidth * 1.1,
                child: DecoratedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "32K",
                        style: theme.textTheme.headline1,
                      ),
                      Text(
                        "Views",
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                  decoration: boxDecoration,
                ),
              ),
              SizedBox(width: cardWidth / 4),
              SizedBox(
                width: cardWidth,
                height: cardWidth * 1.1,
                child: DecoratedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "6K",
                        style: theme.textTheme.headline1,
                      ),
                      Text(
                        "Shares",
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                  decoration: boxDecoration,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
