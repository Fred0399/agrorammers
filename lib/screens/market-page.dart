import 'package:agrorammers/data/user.dart';
import 'package:flutter/material.dart';

import '../market_item.dart';

var user = [
  MarketUser(
      imageUrl: '1',
      email: 'man@mail.rus',
      name: 'John',
      id: '245',
      plants: ['Sarımsaq', 'Xiyar', 'Yemiş']),
  MarketUser(
      imageUrl: '2',
      email: 'man@mail.rus',
      name: 'John',
      id: '227',
      plants: ['Yemiş', 'Pomidor', 'Xiyar']),
  MarketUser(
      imageUrl: '3',
      email: 'man@mail.rus',
      name: 'John',
      id: '932',
      plants: ['Xiyar', 'Yemiş', 'Sarımsaq']),
  MarketUser(
      imageUrl: '4',
      email: 'man@mail.rus',
      name: 'John',
      id: '147',
      plants: ['Soğan', 'Pomidor', 'Yemiş']),
];

class MarketPage extends StatelessWidget {
  static const routeName = 'MarketplacePage';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: user.map((obj) => MarketItem(obj)).toList()),
    );
  }
}
