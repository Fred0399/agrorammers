import 'package:agrorammers/data/plant_data.dart';
import 'package:agrorammers/others/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserPlants {
  Future<List<PlantData>> getPlants(String socialId) async {
    final response = await http.post(getPlant, body: {'social_id': socialId});
    final extractedData = json.decode(response.body) as List<dynamic>;
    if (extractedData == null) {
      return null;
    }
    List<PlantData> list = [];
    extractedData.map((val) {
      if (val['status'] == "success") {
        print(val['plant']);
        list.add(
          PlantData(
            id: val['plant']['id'],
            imageUrl: val['plant']['picture'],
            title: val['plant']['title'],
            tasks: []
          ),
        );
      }
    }).toList();
    return list;
  }
}
