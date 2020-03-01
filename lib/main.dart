import 'package:agrorammers/screens/catalog_disease_info_page.dart';
import 'package:agrorammers/screens/catalog_diseases_list_page.dart';

import 'package:agrorammers/screens/insect_info_page.dart';
import 'package:agrorammers/screens/insect_list_page.dart';

import 'package:agrorammers/screens/home_page.dart';
import 'package:agrorammers/screens/market-page.dart';
import 'package:agrorammers/widgets/forum_full.dart';
import 'package:flutter/material.dart';
import 'blocs/login_provider.dart';
import 'screens/catalog_page.dart';
import 'screens/insect_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => LoginPage(),
          CatalogPage.routeName: (ctx) => CatalogPage(),
          CatalogDiseasesListPage.routeName: (ctx) => CatalogDiseasesListPage(),
          CatalogDiseaseInfoPage.routeName: (ctx) => CatalogDiseaseInfoPage(),
          ForumFull.routeName: (ctx) => ForumFull(),
          MarketPage.routeName: (ctx) => MarketPage(),
          InsectPage.routeName: (ctx) => InsectPage(),
          InsectListPage.routeName: (ctx) => InsectListPage(),
          InsectInfoPage.routeName: (ctx) => InsectInfoPage(),
        },
      ),
    );
  }
}
