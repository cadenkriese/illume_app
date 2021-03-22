import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/screens/home/widgets/feed.dart';
import 'package:illume_app/screens/home/widgets/top_bar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState(0);
}

class _HomeState extends State<Home> {
  final int index;
  _HomeState(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        //TODO refresh logic
        onRefresh: () async {},
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              //TODO consider persistent appbar
              TopBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  //TODO get from state
                  child: Text("Florence",
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ),
              BlocProvider(
                create: (BuildContext context) => FeedCubit()..load(),
                child: BlocBuilder<FeedCubit, List<PostPreview>>(
                  builder: (context, state) => Feed(state),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
