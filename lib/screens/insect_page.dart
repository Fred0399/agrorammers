import 'package:agrorammers/Insect_item.dart';
import 'package:agrorammers/others/insect_data.dart';
import 'package:flutter/material.dart';

class InsectPage extends StatelessWidget {
  static const String routeName = 'Insect Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Məlumat'),
      ),
      body: ListView(
        children:
            insectPlants.map((title) => InsectItem(title: title)).toList(),
      ),
    );
  }
}
