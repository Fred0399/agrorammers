import 'package:agrorammers/data/plant_data.dart';
import 'package:agrorammers/others/urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Plants {
  Future<List<PlantData>> searchPlant(String desc) async {
    final response = await http.post(searchPlantss, body: {'title': desc});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return null;
    }
    List<PlantData> list = [];

    if (extractedData['status'] == "success") {
      for (Map<String, dynamic> item in extractedData['data']) {
        print(item);
        list.add(
          PlantData(
            id: item['id'],
            title: item['title'],
            imageUrl: item['picture'],
          ),
        );
      }
    }
    return list;
  }
}
