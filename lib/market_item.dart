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
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: (imageUrl != null)
                            ? Image.network(
                                imageUrl,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.height * 0.1,
                              )
                            : Image.asset(
                                "assets/ui_icons/user.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.height * 0.1,
                              ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Id number',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '#236',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/catalog_items/' + items[0] + '.png',
                            ),
                          ),
                        ),
                        child: Positioned(
                          bottom: 0,
                          left: 0,
                          child: Image.asset(
                            'assets/catalog_items/' + items[0] + '.png',
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          'assets/catalog_items/' + items[0] + '.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          'assets/catalog_items/' + items[0] + '.png',
                          fit: BoxFit.scaleDown,
                        ),
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
