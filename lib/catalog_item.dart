import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  final String title;
  final String imagePath;

  CatalogItem(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.red,
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: Colors.yellowAccent.withOpacity(0.7),
        ),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
