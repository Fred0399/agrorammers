import 'dart:convert';

import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/others/urls.dart';
import 'package:http/http.dart' as http;

class SearchUser {
  Future<List<User>> searchUser(String email) async {
    final response = await http.post(searchMember, body: {'email': email});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return null;
    }
    List<User> list = [];
    if (extractedData['status'] == 'success') {
      for (Map<String, dynamic> item in extractedData['data']) {
        list.add(
          new User(
            id: item['id'],
            name: item['name'],
            email: item['email'],
            imageUrl: item['picture_url'],
            socialId: item['social_id'],
          ),
        );
      }
    }
    return list;
  }

  Future<bool> addMember(int socialID, int plantID) async {
    print(socialID);
    print(plantID);
    final response = await http.post(addMemberr,
        body: {'plant': plantID.toString(), 'member': socialID.toString()});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return null;
    }

    return (extractedData['status'] == "success") ? true : false;
  }
}
