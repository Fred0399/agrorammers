import 'package:agrorammers/catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  static const String routeName = 'Catalog Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          CatalogItem('tie', 'assets/catalog_items/melon.png')
        ],
      ),
    );
  }
}
