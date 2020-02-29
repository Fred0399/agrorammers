import 'package:flutter/material.dart';
import 'blocs/login_provider.dart';
import 'colors.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final MaterialColor colorCustom = MaterialColor(0xFF0158B7, color);

  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LoginPage(),
        
      ),
    );
  }
}
