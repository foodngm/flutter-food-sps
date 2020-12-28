import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ngm/src/models/cart_item.dart';
import 'package:food_ngm/src/models/user.dart';
class UserServices{
  String collection = "users";
 FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).add(values);
  }

  void updateUserData(Map<String, dynamic> values){
    _firestore.collection(collection).document(values['id']).updateData(values);
  }


  void addToCart({String userId, CartItemModel cartItem}){
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}){
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }


  Future<UserModel> getUserById(String id) => _firestore.collection(collection).document(id).get().then((doc){
    print("gettUserById");
    return UserModel.fromSnapshot(doc);
  });
}