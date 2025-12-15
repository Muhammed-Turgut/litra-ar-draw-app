import 'package:flutter/cupertino.dart';

class UsersPostItem{
  final String userId;
  final String? postTitle;
  final String imageUrl;
  final String? postContent;
  final int? sparkScore;
  final String? createdAt;


  UsersPostItem({
    required this.userId,
    this.postTitle,
    this.postContent,
    this.createdAt,
    required this.imageUrl,
    this.sparkScore,
    Key? key
  });
}