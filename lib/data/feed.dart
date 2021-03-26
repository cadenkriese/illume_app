import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:illume_app/data/user.dart';

class FeedCubit extends Cubit<List<PostPreview>> {
  FeedCubit() : super([]);

  List<User> mockUsers = [
    User(
      "identification",
      "Jasmine Smith",
      AssetImage("assets/sample/1.jpg"),
    ),
    User(
      "identification",
      "Vinod Nambiar",
      AssetImage("assets/sample/2.jpg"),
    ),
    User(
      "identification",
      "Mark Dalton",
      AssetImage("assets/sample/3.jpg"),
    ),
    User(
      "identification",
      "John Bowers",
      AssetImage("assets/sample/4.jpg"),
    ),
    User(
      "identification",
      "Trisha Lawrence",
      AssetImage("assets/sample/5.jpg"),
    ),
    User(
      "identification",
      "Anthony Olivio",
      AssetImage("assets/sample/6.jpg"),
    ),
  ];

  Future<void> load() async {
    // TODO get state from firebase.
    sleep(Duration(seconds: 3));
    List<PostPreview> mockFeed = [
      PostPreview(
        mockUsers[0],
        "Hi all, I'm proud to announce that I've joined Google as an engineer on their Flutter team!🤩 Unfortunately that means I'll be moving to San Francisco, I'll miss everyone in this office 😢 be sure to link with me to stay in touch!",
        DateTime(2021, 3, 21, 14, 20),
        904,
        false,
        [],
      ),
      PostPreview(
        mockUsers[1],
        "Just finished this billboard for a local business!",
        DateTime(2021, 3, 21, 7, 5),
        23,
        false,
        [Image.asset("assets/sample/billboard.png")],
      ),
      PostPreview(
        mockUsers[2],
        "There's a new coffee shop in town! Who's down to go meet up and have some cold brew?️️️️️️☕",
        DateTime(2021, 3, 21, 12, 34),
        764,
        false,
        [],
      ),
      PostPreview(
        mockUsers[3],
        "Going to try out working at the local library today, should be productive!😎",
        DateTime(2021, 3, 21, 13, 37),
        96,
        false,
        [],
      ),
      PostPreview(
        mockUsers[4],
        "Hi all, I designed a free simple budget tool for my fellow small business owners! Download the Excel file below!",
        DateTime(2021, 3, 21, 17, 2),
        102,
        false,
        [],
      ),
      PostPreview(
        mockUsers[5],
        "Hi, if any graphic designers are in this office please let me know, I need help with a logo for my new app!",
        DateTime(2021, 3, 21, 9, 10),
        671,
        false,
        [],
      ),
    ];
    emit(mockFeed);
    return;
  }

  Future<void> toggleLike(PostPreview post) async {
    List<PostPreview> feed = List.of(state);

    int index = feed.indexOf(post);

    post.hasLiked = !post.hasLiked;
    post.likes = post.hasLiked ? post.likes + 1 : post.likes - 1;

    feed[index] = post;

    //TODO firebase request, possibly delayed to check if they unliked or not to avoid spam.
    emit(feed);
  }

  Future<void> submitPoast(PostPreview post) async {
    emit(List.of(state)..add(post));
  }
}

class PostPreview {
  User poster;
  String content;
  DateTime postTime;
  int likes;
  bool hasLiked;
  List<Image> attachments;
  PostPreview(this.poster, this.content, this.postTime, this.likes,
      this.hasLiked, this.attachments);
}
