import '../CartDatabase/cartDB.dart';

class CartModel {
  int? cartId;
  String? url;
  String? name;
  double? price;
  double? rate;
  int? clients;

  CartModel(this.cartId, this.url, this.clients, this.name, this.price, this.rate);

  CartModel.fromMap(Map<String, dynamic> map) {
    cartId = map['cartId'];
    url = map['url'];
    name = map['name'];
    price = map['price'];
    rate = map['rate'];
    clients = map['clients'];
  }

  Map<String, dynamic> toMap() {
    return {
      CartDatabase.columnCartId: cartId,
      CartDatabase.columnUrl: url,
      CartDatabase.columnName: name,
      CartDatabase.columnPrice: price,
      CartDatabase.columnRate: rate,
      CartDatabase.columnClients: clients
    };
  }
}