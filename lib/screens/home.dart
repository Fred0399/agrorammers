import 'package:agrorammers/data/plant_data.dart';
import 'package:agrorammers/widgets/my_plant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List<PlantData> list;

  Home(this.list);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.list.map(
        (val) {
          return MyPlant(
            plantData: val,
          );
        },
      ).toList()),
    );
  }
}
