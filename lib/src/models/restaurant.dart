import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const RATES = "rates";
  static const IMAGE = "image";
  static const POPULAR = "popular";



  String _id;
  String _name;
  String _image;
  List<String> _userLikes;
  int _rating;
  int _avgPrice;
  bool _popular;
  int _rates;

//  getters
  String get id => _id;

  String get name => _name;

  String get image => _image;

  List<String> get userLikes => _userLikes;

  int get avgPrice => _avgPrice;

  int get rating => _rating;

  bool get popular => _popular;

  int get rates => _rates;

  // public variable
  bool liked = false;


  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    if(!snapshot.exists) {
      _id = "";
      _name = "";
      _image =  "";
      _avgPrice =  0;
      _rating =  0;
      _popular = false;
      _rates = 0;
    }else{
      _id = snapshot.get(ID);
      _name = snapshot.get(NAME);
      _image = snapshot.get(IMAGE);
      _avgPrice = snapshot.get(AVG_PRICE);
      _rating = snapshot.get(RATING);
      _popular = snapshot.get(POPULAR);
      _rates = snapshot.get(RATES);
    }

  }

  RestaurantModel.fromQuerySnapshot(QuerySnapshot snapshot) {
    QueryDocumentSnapshot doc =  snapshot.docs.first;
    _id = doc.get(ID);
    _name = doc.get(NAME);
    _image = doc.get(IMAGE);
    _avgPrice = doc.get(AVG_PRICE);
    _rating = doc.get(RATING);
    _popular = doc.get(POPULAR);
    _rates = doc.get(RATES);
  }
}
