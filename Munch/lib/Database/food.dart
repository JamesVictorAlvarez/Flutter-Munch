import 'foodDB.dart';

class Food {
  int? foodId;
  String? url;
  String? name;
  double? price;
  double? rate;
  int? clients;

  Food(this.foodId, this.url, this.clients, this.name, this.price, this.rate);

  Food.fromMap(Map<String, dynamic> map) {
    foodId = map['foodId'];
    url = map['url'];
    name = map['name'];
    price = map['price'];
    rate = map['rate'];
    clients = map['clients'];
  }

  Map<String, dynamic> toMap() {
    return {
      FoodDatabase.columnFoodId: foodId,
      FoodDatabase.columnUrl: url,
      FoodDatabase.columnName: name,
      FoodDatabase.columnPrice: price,
      FoodDatabase.columnRate: rate,
      FoodDatabase.columnClients: clients,
    };
  }
}