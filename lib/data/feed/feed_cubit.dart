import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:illume_app/screens/user.dart';

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
        "",
        [],
      ),
    ];
    emit(FeedState.initialized(feed));
    return;
  }
}
