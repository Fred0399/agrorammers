import 'package:agrorammers/others/catalog_data.dart';
import 'package:flutter/material.dart';

class CatalogDiseaseInfoPage extends StatelessWidget {
  static const routeName = 'CatalogDiseaseInfoPage';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final diseaseName = routeArgs['diseaseName'];
    final diseaseParent = routeArgs['diseaseParent'];
    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseName),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(
                  image: AssetImage(
                      'assets/' + diseaseParent + '/' + diseaseName + '.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  child: Text(
                    diseasesInformation[diseaseName],
                    textAlign: TextAlign.start,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
