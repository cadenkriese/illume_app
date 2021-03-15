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

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 12,
                  foregroundImage: data.poster.photo,
                ),
                // Spacer(),
                // ElevatedButton(
                //   child: Icon(Icons.favorite_outline_rounded),
                //   style: ButtonStyle(elevation: MaterialStateProperty.all(5)),
                //   onPressed: () => {print("pressed")},
                // )
              ],
            ),
            SizedBox(width: 5),
            Expanded(
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
          ]),
    );
  }
}
