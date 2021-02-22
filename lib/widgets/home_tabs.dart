import 'package:flutter/material.dart';

import 'package:delivery_app_code/screens/cart_screen.dart';
import 'package:delivery_app_code/screens/home_screen.dart';

class HomeTabs extends StatefulWidget {
  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _index = 0;

  var pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(),
      HomeScreen(),
      CartScreen(),
      HomeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor,
        currentIndex: _index,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.fastfood, color: Theme.of(context).primaryColor),
              icon: Icon(Icons.fastfood, color: Colors.white),
              title: Text("Menu",
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14.0))),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite, color: Theme.of(context).primaryColor),
              icon: Icon(Icons.favorite_border, color: Colors.white),
              title: Text("Favorite",
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14.0))),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_cart, color: Theme.of(context).primaryColor),
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              title: Text("Cart",
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14.0))),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: Theme.of(context).primaryColor),
              icon: Icon(Icons.person, color: Colors.white),
              title: Text("Profile",
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14.0))),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
