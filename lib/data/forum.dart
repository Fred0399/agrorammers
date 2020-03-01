import 'package:flutter/foundation.dart';

class Forum {
  int id;
  int userID;
  String title;
  String body;
  String userName;
  String userPicUrl;
  Forum({
    @required this.id,
    this.body,
    @required this.userID,
    this.title,
    this.userName,
    this.userPicUrl,
  });
}

class Comment {
  int commentID;
  int commentUserID;
  String commentBody;
  Comment({
    @required this.commentID,
    @required this.commentUserID,
    this.commentBody,
  });
}
