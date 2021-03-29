import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/post.dart';
import 'package:intl/intl.dart';

class LikeButton extends StatelessWidget {
  LikeButton(this.post);
  final Post post;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return TextButton(
      child: Column(
        children: [
          Icon(
            post.hasLiked
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
            color:
                post.hasLiked ? Colors.red : theme.textTheme.bodyText1!.color,
            // TODO get color from a better spot
          ),
          SizedBox(height: 3),
          Text(
            NumberFormat.compact().format(post.likes),
            style: theme.textTheme.caption,
          ),
        ],
      ),
      onPressed: () => context.read<FeedCubit>().toggleLike(post),
    );
  }
}
