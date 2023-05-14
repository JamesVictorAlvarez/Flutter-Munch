import 'package:flutter/material.dart';
import 'package:munch/header.dart';
import 'package:munch/Database/CartDatabase/cartDB.dart';
import 'package:munch/Database/CartDatabase/cartModel.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  final dbHelper = CartDatabase.instance;

  TabController? _tabController;
  List<CartModel> foodList = [];

  @override
  void initState() {
    this._tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
    _queryAll();
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    foodList = allRows.map((item) => CartModel.fromMap(item)).toList();
    setState(() {});
  }

  void _delete(id) async {
    final rowsDeleted = await dbHelper.delete(id);
    _queryAll();
  }

  void _insert(url, name, price, rate, clients) async {
    Map<String, dynamic> row = {
      CartDatabase.columnUrl: url,
      CartDatabase.columnName: name,
      CartDatabase.columnPrice: price,
      CartDatabase.columnRate: rate,
      CartDatabase.columnClients: clients
    };
    CartModel cart = CartModel.fromMap(row);
    final id = await dbHelper.insert(cart);
  }

  Widget renderAddList() {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: (BuildContext context, int index) {
        Color primaryColor = Theme.of(context).primaryColor;
        return Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: 'detail_food$index',
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(foodList[index].url!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(foodList[index].name!),
                                IconButton(
                                    onPressed: () =>
                                        _delete(foodList[index].cartId),
                                    icon: Icon(Icons.delete_outline)),
                              ],
                            ),
                            Text('${foodList[index].price}\$'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.remove),
                                Container(
                                  color: primaryColor,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 12.0,
                                  ),
                                  child: Text(
                                    '${foodList[index].rate!.toString()} stars',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget renderTracking() {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: (BuildContext context, int index) {
        Color primaryColor = Theme.of(context).primaryColor;
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: 'detail_food$index',
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(foodList[index].url!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(foodList[index].name!),
                                Text(
                                  'Tracking Item',
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                            Text('${foodList[index].price}\$'),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'View Detail',
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget renderDoneOrder() {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: (BuildContext context, int index) {
        Color primaryColor = Theme.of(context).primaryColor;
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: 'detail_food$index',
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(foodList[index].url!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              // child: Text(cart['name']),
                            ),
                            Text('${foodList[index].price}\$'),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // Text(cart['rate']),
                                    Text(
                                      'Give your review',
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: <Widget>[
          CustomHeader(
            title: 'Cart Food',
            quantity: foodList.length,
            internalScreen: false,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
            ),
            child: TabBar(
              controller: this._tabController,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.black87,
              tabs: <Widget>[
                Tab(text: 'Add Cart'),
                Tab(text: 'Tracking Order'),
                Tab(text: 'Done Order'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TabBarView(
                controller: this._tabController,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: this.renderAddList(),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 35.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: theme.primaryColor,
                        ),
                        child: Text(
                          'CHECKOUT',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: this.renderTracking(),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 65.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 35.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: theme.primaryColor,
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.location_searching,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'View Tracking Order',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  this.renderDoneOrder(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
