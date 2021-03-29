import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/screens/post_detail/post_detail.dart';
import 'package:illume_app/util/duration_format.dart';
import 'package:illume_app/widgets/like_button.dart';
import 'package:share/share.dart';

class IllumePost extends StatelessWidget {
  final Post data;

  const IllumePost({required this.data});

  //TODO consider abstracting shape icon and button to an IllumeCard class

  //TODO allow initialization with null data and have gray bars with loading
  // animations

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: context.read<FeedCubit>(),
            child: PostDetail(data),
          ),
        ),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      foregroundImage: data.poster.photo,
                    ),
                    Spacer(),
                    LikeButton(data),
                    TextButton(
                      onPressed: () => Share.share(data.content),
                      child: Icon(
                        Icons.share,
                        color: theme.textTheme.bodyText1!.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.poster.name,
                            style: theme.textTheme.headline6,
                          ),
                          Text(
                            DateTime.now().difference(data.postTime).compact(),
                            style: theme.textTheme.subtitle2,
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      SelectableText(
                        data.content,
                        style: theme.textTheme.bodyText1,
                      ),
                      //TODO bad code
                      if (data.attachments.length > 0)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: data.attachments[0],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}
