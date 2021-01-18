import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(this._image);
  final ImageProvider _image;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: _ProfilePictureClipper(),
      child: Image(image: ResizeImage(_image, width: 24, height: 24)),
    );
  }
}

class _ProfilePictureClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 24, 24);
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
