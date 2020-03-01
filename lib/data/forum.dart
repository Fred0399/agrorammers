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
    this.userID,
    this.title,
    this.userName,
    this.userPicUrl,
  });
}

class Comment {
  int commentID;
  String commentUserProfIMg;
  String commentBody;
  String commentUserName;
  Comment({
    @required this.commentID,
    this.commentUserProfIMg,
    this.commentBody,
    this.commentUserName,
  });
}
