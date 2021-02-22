import 'package:flutter/material.dart';

import 'package:delivery_app_code/screens/home_screen.dart';
import 'package:delivery_app_code/widgets/home_tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Burger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SuezOne',
        primaryColor: Color.fromRGBO(255, 218, 0, 1),
        accentColor: Color.fromRGBO(15, 15, 15, 1),        
      ),
      home: HomeTabs(),
    );
  }
}
