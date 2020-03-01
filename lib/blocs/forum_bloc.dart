import 'dart:convert';

import 'package:agrorammers/data/forum.dart';
import 'package:agrorammers/others/urls.dart';
import 'package:http/http.dart' as http;

class ForumBloc {
  Future<bool> addForum(String title, String body, int userID) async {
    final response = await http.post(addForumm,
        body: {'title': title, 'body': body, 'user_id': userID.toString()});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return false;
    }
    return (extractedData["status"] == "success") ? true : false;
  }

  Future<List<Forum>> getForums() async {
    final response = await http.get(getFormss);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return [];
    }
    List<Forum> list = [];
    if (extractedData['status'] == "success") {
      for (Map<String, dynamic> item in extractedData['data']) {
        list.add(Forum(
            id: item['id'],
            body: item['content'],
            title: item['title'],
            userName: item['name'],
            userPicUrl: item['picture_url']));
      }
    }
    return list;
  }

  Future<List<Comment>> getComment(int formID) async {
    final response =
        await http.post(getCommentss, body: {'form_id': formID.toString()});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return [];
    }
    List<Comment> list = [];
    if (extractedData["status"] == "success") {
      for (Map<String, dynamic> item in extractedData["data"]) {
        list.add(
          Comment(
            commentID: item['id'],
            commentBody: item['comment_content'],
            commentUserProfIMg: item['picture_url'],
            commentUserName: item['name'],
          ),
        );
      }
    }
    return list;
  }

  Future<bool> addComment(String body, int formID, int userID) async {
    final response = await http.post(addCommentss, body: {
      'body': body,
      'user_id': userID.toString(),
      'form_id': formID.toString()
    });
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return false;
    }
    return (extractedData["status"] == "success") ? true : false;
  }
}
