import 'package:agrorammers/others/insect_data.dart';
import 'package:flutter/material.dart';

import '../Insect_item.dart';

class InsectListPage extends StatelessWidget {
  static const routeName = 'InsectListPage';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final plantName = routeArgs['plantName'];
    List diseasesList = insects[plantName];
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
      ),
      body: ListView(
        children: diseasesList
            .map(
              (title) => InsectItem(
                title: title,
                imageFolder: 'insects/' + plantName,
                imageType: 'jpg',
                pageInd: '1',
              ),
            )
            .toList(),
      ),
    );
  }
}
