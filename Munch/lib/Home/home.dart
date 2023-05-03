import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:munch/Database/foodDB.dart';
import 'package:munch/Database/food.dart';
import 'foodCard.dart';

class Home extends StatelessWidget {
  final dbHelper = FoodDatabase.instance;
  List<Food> food = [];
  // final List<Map<String, String>> popularFood = [
  //   {
  //     'name': 'Bat Soup',
  //     'price': '1.00',
  //     'rate': '5',
  //     'clients': '20,000',
  //     'image': 'assets/images/BatSoup.jpeg'
  //   },
  //   {
  //     'name': 'Bat Soup',
  //     'price': '1.00',
  //     'rate': '5',
  //     'clients': '20,000',
  //     'image': 'assets/images/BatSoup.jpeg'
  //   },
  //   {
  //     'name': 'Bat Soup',
  //     'price': '1.00',
  //     'rate': '5',
  //     'clients': '20,000',
  //     'image': 'assets/images/BatSoup.jpeg'
  //   },
  //   {
  //     'name': 'Bat Soup',
  //     'price': '1.00',
  //     'rate': '5',
  //     'clients': '20,000',
  //     'image': 'assets/images/BatSoup.jpeg'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Munch',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: theme.primaryColor, width: 1.0),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 28.0,
                    color: theme.primaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    size: 28.0,
                    color: theme.primaryColor,
                  ),
                  hintText: 'Find food',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 19.0,
                  ),
                ),
              ),
            ),
            Container(
              width: 165,
              child: ElevatedButton(
                onPressed: () {
                  _insert('assets/images/BatSoup.jpeg', 'BatSoup', 9.99, 4.21, 20);
                  _queryAll();
                },
                child: Text('ADD'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                bottom: 10.0,
              ),
              child: Text(
                'Popular Food',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            Container(
              height: 220.0,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Hero(
                      tag: 'detail_food$index',
                      child: FoodCard(
                        width: size.width / 2 - 30.0,
                        primaryColor: theme.primaryColor,
                        productName: food[0].name!,
                        productPrice: food[0].price.toString(),
                        productUrl: food[0].url!,
                        productClients: food[0].clients.toString(),
                        productRate: food[0].rate.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                bottom: 10.0,
                top: 35.0,
              ),
              child: Text(
                'Best Food',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Map<String, String> localProduct = {
                  'name': 'The number one!',
                  'price': '26.00',
                  'rate': '5.0',
                  'clients': '150',
                  'image': 'assets/images/BatSoup.jpeg'
                };
                Navigator.pushNamed(context, 'details', arguments: {
                  'product': localProduct,
                  'index': food.length
                });
              },
              child: Hero(
                tag: 'detail_food${food.length}',
                child: Container(
                  width: size.width - 40,
                  color: Colors.white,
                  padding: EdgeInsets.only(bottom: 10.0),
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 15.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: size.width - 40,
                            width: size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/images/BatSoup.jpeg'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.favorite,
                                size: 25.0,
                                color: theme.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 4.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'The number one!',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 4.0,
                                      offset: Offset(3.0, 3.0),
                                    )
                                  ]),
                              child: Icon(
                                Icons.near_me,
                                size: 22.0,
                                color: theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '5.0 \(150\)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[400],
                              ),
                            ),
                            Text(
                              '\$ 26.00',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _insert(url, name, price, rate, clients) async {
    Map<String, dynamic> row = {
      FoodDatabase.columnUrl: url,
      FoodDatabase.columnName: name,
      FoodDatabase.columnPrice: price,
      FoodDatabase.columnRate: rate,
      FoodDatabase.columnClients: clients
    };
    Food food = Food.fromMap(row);
    final id = await dbHelper.insert(food);
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    food.clear();
    allRows.forEach((row) => food.add(Food.fromMap(row)));
  }
}
