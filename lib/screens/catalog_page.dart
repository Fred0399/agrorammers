import 'package:agrorammers/catalog_item.dart';
import 'package:agrorammers/others/catalog_data.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  static const String routeName = 'Catalog Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: catalogPlants.map((title) => CatalogItem(title)).toList(),
      ),
    );
  }
}
