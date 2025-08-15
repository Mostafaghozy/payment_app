import 'package:payment_app/data/models/amount_model/amount_model.dart';
import 'package:payment_app/data/models/amount_model/details.dart';
import 'package:payment_app/data/models/item_list_model/item.dart';
import 'package:payment_app/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransactionData() {
  var amount = AmountModel(
    currency: "USD",
    total: "70",
    details: Details(shipping: "0", shippingDiscount: 0, subtotal: "70"),
  );
  List<OrderItemModel> orders = [
    OrderItemModel(name: "Apple", quantity: 4, price: '5', currency: "USD"),
    OrderItemModel(
      name: "Pineapple",
      quantity: 5,
      price: '10',
      currency: "USD",
    ),
  ];
  var itemList = ItemListModel(orders: orders);
  return (amount: amount, itemList: itemList);
}
