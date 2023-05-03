import 'package:flutter/material.dart';
import 'Home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Home(),
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
            ],
          ),
        ),
      ),
    );
  }
}