import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app_course_resto/models/order.dart';

class OrderServices{
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({String userId, String id,String description,String status ,List cart, int totalPrice}) {
    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "id": id,
      "cart": cart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "description": description,
      "status": status
    });
  }

  Future<List<OrderModel>> restaurantOrders({String restaurantId}) async =>
      _firestore
          .collection(collection)
          .where("restaurantIds", arrayContains: restaurantId)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        print("NUMBER OF ORDERS: " + orders.length.toString());
        print("NUMBER OF ORDERS: " + orders.length.toString());
        print("NUMBER OF ORDERS: " + orders.length.toString());
        print("NUMBER OF ORDERS: " + orders.length.toString());
        print("NUMBER OF ORDERS: " + orders.length.toString());
        print("NUMBER OF ORDERS: " + orders.length.toString());

        return orders;
      });

}