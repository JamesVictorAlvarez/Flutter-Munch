import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:munch/Database/Food/foodDB.dart';
import 'package:munch/Database/CartDatabase/cartDB.dart';
import 'package:munch/Database/CartDatabase/cartModel.dart';
import 'package:munch/Database/Food/food.dart';
import 'foodCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dbHelper = FoodDatabase.instance;
  final dbCartHelper = CartDatabase.instance;

  List<Map<String, dynamic>> food = [];
  List<Food> foodList = [];

  @override
  void initState() {
    super.initState();
    _queryAll();
  }

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
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Munch',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFFE85852),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                right: 20.0,
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
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
            const Padding(
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
            SizedBox(
              height: 220.0,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(foodList[index].name!),
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              foodList[index].url!))),
                                  child: Text('${foodList[index].price}\$'),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        _insertCart(
                                            foodList[index].url,
                                            foodList[index].name,
                                            foodList[index].price,
                                            foodList[index].rate,
                                            foodList[index].clients);
                                      },
                                      child: const Text(
                                        'Add to cart',
                                        style:
                                            TextStyle(color: Color(0xFFE85852)),
                                      ))
                                ],
                              ));
                    },
                    child: Hero(
                      tag: 'detail_food$index',
                      child: FoodCard(
                        width: size.width / 2 - 30.0,
                        primaryColor: theme.primaryColor,
                        productName: foodList[index].name!,
                        productPrice: foodList[index].price.toString(),
                        productUrl: foodList[index].url!,
                        productClients: foodList[index].clients.toString(),
                        productRate: foodList[index].rate.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
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
                Navigator.pushNamed(context, 'details',
                    arguments: {'product': localProduct, 'index': food.length});
              },
              child: Hero(
                tag: 'detail_food${food.length}',
                child: Container(
                  width: size.width - 40,
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 10.0),
                  margin: const EdgeInsets.only(
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
                            decoration: const BoxDecoration(
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
                            margin: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
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
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 4.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'The number one!',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: const BoxDecoration(
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
                        padding: const EdgeInsets.only(
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
                            const Text(
                              '26.00\$ ',
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

  void _insertCart(url, name, price, rate, clients) async {
    Map<String, dynamic> row = {
      CartDatabase.columnUrl: url,
      CartDatabase.columnName: name,
      CartDatabase.columnPrice: price,
      CartDatabase.columnRate: rate,
      CartDatabase.columnClients: clients
    };
    CartModel cart = CartModel.fromMap(row);
    final id = await dbCartHelper.insert(cart);
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    foodList = allRows.map((item) => Food.fromMap(item)).toList();
    setState(() {});
  }
}
