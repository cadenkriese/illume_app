import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/widgets/feed.dart';
import 'package:illume_app/screens/home/widgets/home_top_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      //TODO refresh logic
      onRefresh: () async {},
      child: SafeArea(
        child: BlocProvider(
          create: (context) => FeedCubit()..load(),
          child: CustomScrollView(
            slivers: [
              HomeTopBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  //TODO get from state
                  child: Text("Florence",
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ),
              BlocBuilder<FeedCubit, List<Post>>(
                  builder: (context, state) => Feed(state)),
            ],
          ),
        ),
      ),
    );
  }
}
