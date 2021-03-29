import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/mock_data_provider.dart';
import 'package:illume_app/screens/create_post/create_post.dart';
import 'package:illume_app/widgets/illume_logo.dart';

class HomeTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        title: IllumeLogo(),
        centerTitle: false,
        pinned: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<FeedCubit>(),
                        child: CreatePost(kMockUsers[0]),
                      ),
                    ),
                  ),
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
}
