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
              Image(
                image: AssetImage(
                    'assets/' + diseaseParent + '/' + diseaseName + '.jpg'),
                fit: BoxFit.fitWidth,
              ),
              Container(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      diseasesInformation[diseaseName],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
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
