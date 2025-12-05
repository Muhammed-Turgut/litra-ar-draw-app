import 'package:flutter/cupertino.dart';

class UsersPostItem{
  final int id;
  final String userName;
  final String postTitle;
  final String? postContent;
  final int sparkScore;
  final String? userProfileImage;

  UsersPostItem({
    required this.id,
    required this.userName,
    required this.postTitle,
    this.postContent,
    required this.sparkScore,
    this.userProfileImage,
    Key? key
  });
}