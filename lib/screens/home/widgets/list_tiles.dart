import 'package:flutter/material.dart';
import 'package:illume_app/data/feed/feed_cubit.dart';
import 'package:illume_app/widgets/illume_post.dart';

class Feed extends StatelessWidget {
  const Feed(this._feedState);
  final FeedState _feedState;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Post post = _feedState.feed[index];

          if (_feedState == FeedState.loading()) {
            return new CircularProgressIndicator();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: IllumePost(data: post),
          );
        },
        childCount: _feedState.feed.length,
      ),
    );
  }
}
