import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/data/user.dart';
import 'package:illume_app/screens/account/account_detail.dart';
import 'package:illume_app/screens/account/widgets/account_top_bar.dart';
import 'package:illume_app/widgets/feed.dart';

class Account extends StatelessWidget {
  final User user;
  Account(this.user);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      //TODO refresh logic
      onRefresh: () async {},
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            //TODO consider making this a sliver & adding top bar back with settings icon
            AccountTopBar(),
            AccountDetail(user),
            //TODO switch to other logic
            BlocProvider(
              create: (BuildContext context) => FeedCubit()..byUser(user),
              child: BlocBuilder<FeedCubit, List<Post>>(
                builder: (context, state) => Feed(state),
              ),
            )
          ],
        ),
      ),
    );
  }
}
