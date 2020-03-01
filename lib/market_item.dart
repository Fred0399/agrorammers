import 'package:agrorammers/data/user.dart';
import 'package:agrorammers/screens/market-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MarketItem extends StatelessWidget {
  String sellerName;
  String sellerMail;
  String imageInd;
  String id;
  List items;

  MarketItem(MarketUser user) {
    sellerName = user.name;
    sellerMail = user.email;
    imageInd = user.imageUrl;
    items = user.plants;
    id = user.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.23,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Center(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "assets/old_men/" + imageInd + ".png",
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            '#' + id,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                                    'assets/catalog_items/' + items[0] + '.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.23 *
                                      0.5 *
                                      0.4,
                                  child: Image.asset(
                                    'assets/ui_icons/fertilizer.png',
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
                                    'assets/catalog_items/' + items[1] + '.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.23 *
                                      0.5 *
                                      0.4,
                                  child: Image.asset(
                                    'assets/ui_icons/seeds.png',
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
                                    'assets/catalog_items/' + items[2] + '.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.23 *
                                      0.5 *
                                      0.4,
                                  child: Image.asset(
                                    'assets/ui_icons/seeds.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
