import 'package:flutter/material.dart';
import 'package:illume_app/data/feed/feed_cubit.dart';
import 'package:illume_app/screens/home/widgets/profile_picture.dart';

class IllumePost extends StatelessWidget {
  final Post data;

  const IllumePost({Key? key, required this.data}) : super(key: key);

  //TODO allow initialization with null data and have gray bars with loading
  // animations

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProfilePicture(data.poster.photo),
                  Icon(Icons.favorite_outline_rounded, size: 20),
                  Icon(Icons.comment_rounded, size: 20),
                ],
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.poster.name.toUpperCase(),
                      style: theme.textTheme.overline,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SelectableText(
                        // "yo",
                        data.content,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.secondary,
              theme.colorScheme.secondaryVariant,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBar(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Text(
          data.poster.name.toUpperCase(),
          style: theme.textTheme.overline,
        ),
      ],
    );
  }
}
