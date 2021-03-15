import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed/feed_cubit.dart';
import 'package:illume_app/screens/home/widgets/list_tiles.dart';
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
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  //TODO get from state
                  child: Text("Castle Rock Office",
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
              BlocBuilder<FeedCubit, FeedState>(
                bloc: FeedCubit()..load(),
                builder: (context, state) => Feed(state),
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
