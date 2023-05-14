import 'package:flutter/material.dart';
import 'package:munch/Settings/settings.dart';
import 'package:munch/Database/Food/food.dart';
import 'package:munch/Database/Food/foodDB.dart';

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final dbHelper = FoodDatabase.instance;

  List<Food> food = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController clientsController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int index = -1;

  void _showMessageInScaffold(String message) {
    SnackBar(content: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            AdminFirstPage(),
            Settings(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            labelPadding: EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.transparent,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, size: 28),
                text: 'Home',
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

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    food.clear();
    allRows.forEach((row) => food.add(Food.fromMap(row)));
    setState(() {});
  }

  // void _update(id, firstName, lastName) async {
  //   Food person = Food(id, firstName, lastName);
  //   final rowsAffected = await dbHelper.update(person);
  // }

  void _delete(id) async {
    final rowsDeleted = await dbHelper.delete(id);
  }
}

class AdminFirstPage extends StatefulWidget {
  const AdminFirstPage({Key? key}) : super(key: key);

  @override
  State<AdminFirstPage> createState() => _AdminFirstPageState();
}

class _AdminFirstPageState extends State<AdminFirstPage> {
  final dbHelper = FoodDatabase.instance;

  List<Food> food = [];

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    food.clear();
    allRows.forEach((row) => food.add(Food.fromMap(row)));
    setState(() {});
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController clientsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*--------------------------App Bar--------------------------*/
        appBar: AppBar(
          title: Text('Admin'),
        ),
        /*--------------------------App Bar--------------------------*/

        /*---------------------------Body---------------------------*/
        body: Column(
          children: [
            Container(
              width: 350,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
            ),
            Container(
              width: 350,
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: 'Price',
                ),
              ),
            ),
            Container(
              width: 350,
              child: TextField(
                controller: rateController,
                decoration: InputDecoration(
                  hintText: 'Rate',
                ),
              ),
            ),
            Container(
              width: 350,
              child: TextField(
                controller: clientsController,
                decoration: InputDecoration(
                  hintText: 'Clients',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 165,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('ADD'),
                  ),
                ),
                Container(
                  width: 165,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('UPDATE'),
                  ),
                ),
              ],
            ),
            Container(
              width: 350,
              child: Divider(
                thickness: 2,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: food.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('${food[index].name}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // firstNameController.text = food[index].name ?? '';
                                  // setState(() {
                                  //   this.index = index;
                                  // });
                                },
                                child: Image.asset(
                                  'images/edit.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // _delete(food[index].foodId);
                                  _queryAll();
                                },
                                child: Image.asset(
                                  'images/delete.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 350,
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
        /*---------------------------Body---------------------------*/
      ),
    );
  }
}
