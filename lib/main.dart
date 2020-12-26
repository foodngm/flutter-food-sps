import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ngm/src/provider/app.dart';
import 'package:food_ngm/src/provider/category.dart';
import 'package:food_ngm/src/provider/product.dart';
import 'package:food_ngm/src/provider/restaurant.dart';
import 'package:food_ngm/src/provider/user.dart';
import 'package:food_ngm/src/screens/home.dart';
import 'package:food_ngm/src/screens/login.dart';
import 'package:provider/provider.dart';

import 'src/screens/splash.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food SPS',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController())));
}



class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}


