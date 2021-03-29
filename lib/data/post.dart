import 'package:flutter/widgets.dart';
import 'package:illume_app/data/user.dart';

class Post {
  User poster;
  String content;
  DateTime postTime;
  int likes;
  bool hasLiked;
  List<Image> attachments;
  List<Post> responses;
  Post(
    this.poster,
    this.content,
    this.postTime, {
    this.likes = 0,
    this.hasLiked = false,
    this.attachments = const [],
    this.responses: const [],
  });
}
