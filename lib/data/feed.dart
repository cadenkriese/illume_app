import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:illume_app/data/mock_data_provider.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/data/user.dart';

class FeedCubit extends Cubit<List<Post>> {
  FeedCubit() : super([]);

  void load() async {
    // TODO get state from firebase.
    sleep(Duration(seconds: 3));

    emit(kMockFeed);
    return;
  }

  void query(String query) async {
    emit(Fuzzy(kMockFeed).search(query).map((e) => e.item).toList());
  }

  void byUser(User user) {
    emit(kMockFeed.where((element) => element.poster == user).toList());
  }

  /// Toggles the current [User]'s status of liking a post.
  void toggleLike(Post post) async {
    List<Post> feed = List.of(state);

    int index = feed.indexOf(post);

    post.hasLiked = !post.hasLiked;
    post.likes = post.hasLiked ? post.likes + 1 : post.likes - 1;

    feed[index] = post;

    //TODO firebase request, possibly delayed to check if they unliked or not to avoid spam.
    emit(feed);
  }

  void submitPost(Post post) async {
    kMockFeed.add(post);
    emit(kMockFeed);
  }

  void submitResponse(Post parent, Post response) async {
    kMockFeed[kMockFeed.indexOf(parent)].responses.add(response);
    emit(kMockFeed);
  }
}
