import 'package:flutter/material.dart';
import 'package:food_ngm/src/models/category.dart';
import 'package:food_ngm/src/widgets/loading.dart';
import 'package:transparent_image/transparent_image.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   /* return Padding(
      padding: const EdgeInsets.all(6),
      child: Stack(
        children: <Widget>[
          Container(
            width: 140,
            height: 160,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Center(
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: category.image),
                    )
                  ],
                )),
          ),
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [primary, primary])),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: category.name,
                    color: white,
                    size: 26,
                    weight: FontWeight.w300,
                  )))
        ],
      ),
    );*/
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              width: 50,
              height: 60,

              child: Padding(
                padding: EdgeInsets.all(4),
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: category.image),
              )),
          SizedBox(
            height: 2,
          ),
          CustomText(
            text: category.name,
            size: 14,
            color: black,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
