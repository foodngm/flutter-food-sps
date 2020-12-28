import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryServices {
  String collection = "categories";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CategoryModel> categories = [];
        for (DocumentSnapshot category in result.documents) {
          categories.add(CategoryModel.fromSnapshot(category));
        }
        return categories;
      });
}
