import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Text(
                    'Potatoes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Image(
                      image: AssetImage('tomato.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              ),
            ),
          ),
          Image(
            image: AssetImage('tomato.png'),
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }
}
