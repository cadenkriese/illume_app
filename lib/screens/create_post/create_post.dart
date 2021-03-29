import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:illume_app/data/feed.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/data/user.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  final User poster;
  final Post? parent;
  CreatePost(this.poster, {this.parent});

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String content = "";
  List<Image> attachments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              onChanged: (text) => setState(() => content = text),
              maxLength: 300,
              minLines: 4,
              maxLines: null,
            ),
            Row(
              children: attachments
                  .map(
                    (e) => SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: e,
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: Text("Attach Images"),
                  onPressed: () => attachments.length > 2 ? null : _addImage(),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  child: Text("Post"),
                  onPressed: () => content.length > 300 ? null : _post(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _post(BuildContext context) async {
    if (widget.parent == null) {
      context.read<FeedCubit>().submitPost(
            Post(
              widget.poster,
              content,
              DateTime.now(),
              attachments: attachments,
            ),
          );
    } else {
      context.read<FeedCubit>().submitResponse(
            widget.parent!,
            Post(
              widget.poster,
              content,
              DateTime.now(),
              attachments: attachments,
            ),
          );
    }

    Navigator.pop(context);
  }

  void _addImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() => attachments.add(Image.file(File(pickedFile.path))));
  }
}
