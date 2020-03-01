import 'package:agrorammers/data/plant_data.dart';
import 'package:flutter/material.dart';

class MyPlant extends StatefulWidget {
  PlantData plantData;

  MyPlant({this.plantData});

  @override
  _MyPlantState createState() => _MyPlantState();
}

class _MyPlantState extends State<MyPlant> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.25,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2.5,
        child: Column(children: <Widget>[
          Container(
            color: Colors.black45,
            width: screenSize.width * 0.85,
            height: screenSize.height * 0.10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.23,
                  height: screenSize.height * 0.10,
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: widget.plantData.image,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
