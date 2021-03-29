import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/mock_data_provider.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/screens/create_post/create_post.dart';
import 'package:illume_app/widgets/illume_post.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  PostDetail(this.post);

  @override
  Widget build(BuildContext context) {
    int postIndex = kMockFeed.indexOf(post);

    return Scaffold(
      //TODO use https://api.flutter.dev/flutter/material/Stepper-class.html
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<FeedCubit, List<Post>>(
          bloc: context.read<FeedCubit>(),
          builder: (context, state) {
            Post post = state[postIndex];
            return ListView(
              children: [
                IllumePost(data: post),
                for (Post response in post.responses) ...[
                  SizedBox(height: 20),
                  IllumePost(data: response)
                ]
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.comment_outlined),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<FeedCubit>(),
                child: CreatePost(kMockUsers[0], parent: post),
              ),
            ),
          );
        },
      ),
    );
  }
}
