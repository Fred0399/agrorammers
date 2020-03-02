import 'package:agrorammers/data/plant_data.dart';
import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/others/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserPlants {
  List<User> memberList(List<dynamic> val) {
    List<User> list = [];
    for (Map<String, dynamic> item in val) {
      list.add(
        User(
          id: item['id'],
          socialId: item['social_id'],
          imageUrl: item['picture_url'],
          name: item['name'],
          email: item['email'],
        ),
      );
    }
    return list;
  }

  List<TaskCare> taskList(List<dynamic> val) {
    List<TaskCare> list = [];
    for (Map<String, dynamic> item in val) {
      list.add(
        TaskCare(
          isDone: 0,
          note: item['content'],
        ),
      );
    }
    return list;
  }

  Future<List<PlantData>> getPlants(String socialId) async {
    final response = await http.post(getPlant, body: {'social_id': socialId});
    final extractedData = json.decode(response.body) as List<dynamic>;
    if (extractedData == null) {
      return null;
    }
    List<PlantData> list = [];
    extractedData.map((val) {
      if (val['status'] == "success") {
        
        list.add(
          PlantData(
            id: val['plant']['id'],
            imageUrl: val['plant']['picture'],
            title: val['plant']['title'],
            note: val['plant']['notes'],
            description: val['plant']['description'],
            tasks: taskList(val['task_data']),
            members: memberList(val['members']),
          ),
        );
      }
    }).toList();
    return list;
  }
}
