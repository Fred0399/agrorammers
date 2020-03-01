import 'package:agrorammers/data/user.dart';
import 'package:flutter/material.dart';

import '../market_item.dart';

var user = MarketUser(
    email: 'man@mail.rus', name: 'John', plants: ['Pomidor', 'Xiyar', 'Yemiş']);

class MarketPage extends StatelessWidget {
  static const routeName = 'MarketplacePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bazar'),
      ),
      body: Container(
        child: MarketItem(user),
      ),
    );
  }
}

// Container(
//         height: 120.0,
//         width: 120.0,
//         decoration: new BoxDecoration(
//           image: DecorationImage(
//             image: new AssetImage('assets/catalog_items/Pomidor.png'),
//             fit: BoxFit.cover,
//           ),
//           shape: BoxShape.circle,
//         ),
