import 'package:agrorammers/others/catalog_data.dart';
import 'package:flutter/material.dart';

import '../catalog_item.dart';

class CatalogDiseasesListPage extends StatelessWidget {
  static const routeName = 'CatalogDiseasesListPage';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final plantName = routeArgs['plantName'];
    List diseasesList = catalogPlantDiseases[plantName];
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
      ),
      backgroundColor: Colors.green,
      body: ListView(
        children: diseasesList
            .map(
              (title) => CatalogItem(
                title: title,
                imageFolder: 'catalog_diseases/' + plantName,
                imageType: 'jpg',
                pageInd: '1',
              ),
            )
            .toList(),
      ),
    );
  }
}
