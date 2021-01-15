import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed/feed_cubit.dart';
import 'package:illume_app/widgets/illume_post.dart';
import 'package:illume_app/widgets/illume_logo.dart';

class Home extends StatelessWidget {
  static DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          //TODO refresh logic
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              topBar(now, context),
              BlocBuilder<FeedCubit, FeedState>(
                value: FeedCubit()..load(),
                builder: (context, state) {
                  return SliverList(
                    delegate: listTiles(state),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget topBar(DateTime now, BuildContext context) {
    return SliverAppBar(title: IllumeLogo(), actions: [
      IconButton(
          onPressed: () {
            // TODO Consider how to add posts.
          },
          //TODO fix centering somehow
          icon: Icon(Icons.add_circle_outline_rounded)
          //TODO switch to custom icons.
          // child: SvgPicture.asset(
          //   // TODO make a local icons package
          //   "assets/icon/add.svg",
          //   //TODO use theme colors
          //   color: CupertinoColors.activeBlue,
          //   //TODO use lang
          //   semanticsLabel: 'Add to feed.',
          // ),
          ),
    ]);
  }

  SliverChildBuilderDelegate listTiles(FeedState state) {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        Post post = state.feed[index];

        if (state == FeedState.loading()) {
          return new CircularProgressIndicator();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(child: IllumePost(data: post)),
        );
      },
      childCount: state.feed.length,
    );
  }
}
