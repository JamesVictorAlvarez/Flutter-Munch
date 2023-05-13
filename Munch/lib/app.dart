import 'package:flutter/material.dart';
import 'Home/home.dart';
import 'Cart/cart.dart';
import 'Settings/settings.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Home(),
            Cart(),
            Settings(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            labelPadding: EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.transparent,
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, size: 28),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, size: 28),
                text: 'Cart',
              ),
              Tab(
                icon: Icon(Icons.settings, size: 28),
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}