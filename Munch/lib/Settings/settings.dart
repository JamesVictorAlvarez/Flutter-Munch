import 'package:flutter/material.dart';
import 'package:munch/Database/Food/foodDB.dart';
import 'package:munch/Database/Food/food.dart';
import 'package:munch/auth.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final dbHelper = FoodDatabase.instance;
  List<Food> placeHolder = [];

  @override
  void initState() {
    super.initState();
    _queryAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFFE85852),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFE85852),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text('English'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.account_tree_rounded),
              title: Text('Version'),
              subtitle: Text('V. 0.0.02'),
            ),
            SizedBox(height: 16),
            Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFE85852),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Email'),
            ),
            SizedBox(height: 16),
            Text(
              'Security',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFE85852),
              ),
            ),
            SwitchListTile(
              secondary: Icon(Icons.phonelink_lock_sharp),
              title: Text('Lock app in background'),
              value: true,
              onChanged: (bool value) {},
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            ListTile(
                title: TextButton(
              onPressed: signOut,
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Color(0xFFE85852),
                  fontSize: 18,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    placeHolder = allRows.map((item) => Food.fromMap(item)).toList();
    setState(() {});
  }
}
