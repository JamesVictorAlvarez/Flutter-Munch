import 'package:flutter/material.dart';
import '././body_details.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map<dynamic, dynamic> screenArguments = ModalRoute.of(context).settings.arguments;
    Map<dynamic, dynamic> product = screenArguments['product'];
    int index = screenArguments['index'];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'detail_food$index',
            child: Container(
              alignment: Alignment.topCenter,
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product['image']),
                ),
              ),
            ),
          ),
          BodyDetails(),
        ],
      ),
    );
  }
}