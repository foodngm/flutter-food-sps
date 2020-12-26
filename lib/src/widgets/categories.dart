import 'package:flutter/material.dart';
import 'package:food_ngm/src/models/category.dart';

import '../commons.dart';
import 'custom_text.dart';

List<Category> categoriesList = [
  Category(name: "สลัด", image: "food-sps.png"),
  Category(name: "สเต็ก", image: "food-sps.png"),
  Category(name: "ฟาสฟู้ด", image: "food-sps.png"),
  Category(name: "ของหวาน", image: "food-sps.png"),
  Category(name: "อาหารทะเล", image: "food-sps.png"),
  Category(name: "เบียร์", image: "food-sps.png"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, _index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: red, offset: Offset(4, 6), blurRadius: 20)
                    ]),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Image.asset(
                        "images/${categoriesList[_index].image}",
                        width: 50,
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: categoriesList[_index].name,
                  size: 14,
                  color: black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
