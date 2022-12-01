// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     // initialRoute: '/introscreen',
//     initialRoute: '/',
//     getPages: [
//       GetPage(name: '/', page: () => HomePage()),
//       GetPage(name: '/introscreen', page: () => IntroScreen()),
//       GetPage(name: '/signin_page', page: () => SignInScreen()),
//       GetPage(name: '/signup_page', page: () => SignUpScreen()),
//       // GetPage(name: '/favourite_page', page: () => FavouriteScreen()),
//       // GetPage(name: '/cart_page', page: () => CartScreen()),
//       // GetPage(name: '/profile_page', page: () => ProfileScreen()),
//     ],
//   ));
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statehandler_food_ordering_app/providers/product_provider.dart';
import 'package:statehandler_food_ordering_app/views/screen/cart_page.dart';
import 'package:statehandler_food_ordering_app/views/screen/homepage.dart';
import 'package:statehandler_food_ordering_app/views/screen/introscreen.dart';
import 'package:statehandler_food_ordering_app/views/screen/product_homepage.dart';
import 'package:statehandler_food_ordering_app/views/screen/signin_page.dart';
import 'package:statehandler_food_ordering_app/views/screen/signup_page.dart';
import 'package:statehandler_food_ordering_app/views/screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ProductProvider())],
    builder: (context, _) => MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/introscreen',
      initialRoute: '/splash_screen',
      routes: {
        '/': (context) => const HomePage(),
        '/introscreen': (context) => const IntroScreen(),
        '/signin_page': (context) => const SignInScreen(),
        '/signup_page': (context) => const SignUpScreen(),
        '/cart_page': (context) => const CartPage(),
        '/product_detail': (context) => const ProductPage(),
        '/splash_screen': (context) => SplashScreen()
      },
    ),
  ));
}
