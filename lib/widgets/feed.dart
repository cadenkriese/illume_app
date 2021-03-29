import 'package:flutter/material.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/widgets/illume_post.dart';

class Feed extends StatelessWidget {
  const Feed(this._feed);
  final List<Post> _feed;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Post post = _feed[index];

          if (_feed.length == 0) {
            return new CircularProgressIndicator();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
            child: IllumePost(data: post),
          );
        },
        childCount: _feed.length,
      ),
    );
  }
}
