import 'package:flutter/material.dart';
import 'package:illume_app/data/feed/feed_cubit.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: data.poster.photo),
                  IconButton(
                    icon: Icon(Icons.favorite_outline_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.comment_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderBar(context, theme),
                  SizedBox(height: 10),
                  Text(
                    data.content,
                    style: theme.textTheme.bodyText1,
                  ),
                ],
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
