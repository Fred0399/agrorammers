import 'package:agrorammers/others/insect_data.dart';
import 'package:flutter/material.dart';

class InsectInfoPage extends StatelessWidget {
  static const routeName = 'InsectInfoPage';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final InsectName = routeArgs['InsectName'];
    final InsectParent = routeArgs['InsectParent'];
    return Scaffold(
      appBar: AppBar(
        title: Text(InsectName),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(
                    'assets/' + InsectParent + '/' + InsectName + '.jpg'),
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
                      insectInformation[InsectName],
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
