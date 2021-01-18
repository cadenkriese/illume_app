import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:illume_app/data/user.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedState.loading());

  Future<void> load() async {
    // TODO get state from firebase.
    sleep(Duration(seconds: 3));
    List<Post> feed = [
      Post(
        User(
          "identification",
          "Anthony Olivio",
          AssetImage("assets/example/example-profile.png"),
        ),
        "Hi, if any graphic designers are in this office please let me know, I need help with a logo for my new app!",
        [],
      ),
    ];
    emit(FeedState.initialized(feed));
    return;
  }

  Future<void> submitPoast(Post post) async {
    emit(state..feed.add(post));
  }
}
