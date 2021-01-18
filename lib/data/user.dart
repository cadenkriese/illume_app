import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final String id;
  final String name;
  final ImageProvider photo;

  User(this.id, this.name, this.photo);
  @override get props => [id, name, photo];
}