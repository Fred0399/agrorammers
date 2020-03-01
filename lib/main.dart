import 'package:flutter/material.dart';
import 'blocs/login_provider.dart';
import 'screens/catalog_page.dart';

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
        title: 'Login App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => CatalogPage(),
          CatalogPage.routeName: (ctx) => CatalogPage(),
        },
      ),
    );
  }
}
