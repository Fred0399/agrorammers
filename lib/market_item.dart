import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/screens/market-page.dart';
import 'package:flutter/material.dart';

class MarketItem extends StatelessWidget {
  String sellerName;
  String sellerMail;
  String imageUrl;
  List items;

  MarketItem(MarketUser user) {
    sellerName = user.name;
    sellerMail = user.email;
    imageUrl = user.imageUrl;
    items = user.plants;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.23,
      child: Card(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Center(
            child: Row(
              children: [
                ClipRect(
                  //borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: (imageUrl != null)
                      ? Image.network(
                          imageUrl,
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.height * 0.12,
                        )
                      : Image.asset(
                          "assets/ui_icons/user.png",
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.height * 0.12,
                        ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Id number',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 20),
                          Text(
                            '#236',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.23 *
                                    0.35,
                                child: Image.asset(
                                  'assets/catalog_items/Pomidor.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.23 *
                                    0.5 *
                                    0.4,
                                child: Image.asset(
                                  'assets/catalog_items/Pomidor.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.23 *
                                    0.35,
                                child: Image.asset(
                                  'assets/catalog_items/Pomidor.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.23 *
                                    0.5 *
                                    0.4,
                                child: Image.asset(
                                  'assets/catalog_items/Pomidor.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.23 *
                                    0.35,
                                child: Image.asset(
                                  'assets/catalog_items/Pomidor.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.23 *
                                    0.5 *
                                    0.4,
                                child: Image.asset(
                                  'assets/catalog_items/Pomidor.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
