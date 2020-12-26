import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ngm/src/helpers/screen_navigation.dart';
import 'package:food_ngm/src/screens/login.dart';
import 'package:food_ngm/src/widgets/categories.dart';
import 'package:food_ngm/src/widgets/custom_text.dart';

import '../commons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "คุณต้องการกินอะไร",
                      size: 18,
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                          icon: Icon(Icons.notifications_none),
                          onPressed: () {}),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  )
                ]),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(color: grey, offset: Offset(1, 1), blurRadius: 4)
                ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "ค้นหาอาหาร และ ร้านอาหาร",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "ยอดนิยม",
                size: 20,
                color: grey,
              ),
            ),
            Container(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        height: 220,
                        width: 200,
                        decoration: BoxDecoration(color: white, boxShadow: [
                          BoxShadow(
                              color: grey, offset: Offset(1, 1), blurRadius: 4)
                        ]),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/salad.jpeg",
                              height: 140,
                              width: 140,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: "some food",
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                    padding:   EdgeInsets.all(8.0),
                                  child:  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: grey,
                                              offset: Offset(1, 1),
                                              blurRadius: 4)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: red,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),


            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: ()async{

                  try {
                    final newUser = await _auth.signOut();
               changeScreenReplacement(context, LoginScreen());

                  }
                  on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  }
                  catch (e) {
                    print(e);
                  }

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: red,
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(text: "Sign Out", color: white, size: 22,)
                      ],
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
