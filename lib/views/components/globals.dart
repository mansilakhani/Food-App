import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statehandler_food_ordering_app/providers/product_provider.dart';

import '../../models/product_model.dart';

List<Product> products = [
  Product(
    id: 1,
    name: "Pasta",
    price: 100,
    image: "assets/images/pasta.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 100,
  ),
  Product(
    id: 2,
    name: "Dosa",
    price: 200,
    image: "assets/images/dosa.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 200,
  ),
  Product(
    id: 3,
    name: "Garlic Bread",
    price: 150,
    image: "assets/images/garlicbread.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 150,
  ),
  Product(
    id: 4,
    name: "Winter Salad",
    price: 180,
    image: "assets/images/salad.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 180,
  ),
  Product(
    id: 5,
    name: "Tacos",
    price: 250,
    image: "assets/images/tacos.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 250,
  ),
  Product(
    id: 6,
    name: "PaniPuri",
    price: 50,
    image: "assets/images/panipuri.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 50,
  ),
  Product(
    id: 7,
    name: "Fruits Dish",
    price: 200,
    image: "assets/images/fruitdish",
    quantity: 1,
    isLike: "false",
    dummyPrice: 200,
  ),
  Product(
    id: 8,
    name: "Watermelon",
    price: 60,
    image: "assets/images/watermelon.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 60,
  ),
  Product(
    id: 9,
    name: "Strawberry",
    price: 80,
    image: "assets/images/strawberry.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 80,
  ),
  Product(
    id: 10,
    name: "All Grocery",
    price: 1000,
    image: "assets/images/gro1.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 1000,
  ),
  Product(
    id: 11,
    name: "Mix Grocery",
    price: 800,
    image: "assets/images/gro2.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 800,
  ),
  Product(
    id: 12,
    name: "Basic Grocery",
    price: 300,
    image: "assets/images/gro3.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 300,
  ),
  Product(
    id: 13,
    name: "Crude Grocery",
    price: 150,
    image: "assets/images/gro4.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 150,
  ),
  Product(
    id: 14,
    name: "Cabbage",
    price: 40,
    image: "assets/images/cabbage.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 40,
  ),
  Product(
    id: 15,
    name: "Mix Veges",
    price: 90,
    image: "assets/images/veg.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 90,
  ),
];

Widget productContainer(
    {required BuildContext context,
    required String image,
    required int id,
    required String name,
    required double price,
    required Function()? onTap,
    required Function()? plusButtonPressed}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: height * 0.33,
          width: width * 0.44,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  offset: const Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (height * 0.26) / 1.5,
                width: width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          Provider.of<ProductProvider>(context, listen: false)
                              .likeProduct(product: products[id]);
                          log(products[id].isLike, name: "Is Like");
                          log(id.toString(), name: "Index");
                        },
                        icon: (products[id].isLike == "true")
                            ? const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                size: 25,
                                color: Color(0XFFBAC2CD),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0XFF1E2126),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "20min",
                    style: TextStyle(
                      color: Color(0XFFBAC2CD),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Color(0XFFffc107),
                      ),
                      const Text(
                        "2.5",
                        style: TextStyle(
                          color: Color(0XFFBAC2CD),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      color: Color(0XFF1E2126),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        bottom: -60,
        right: -60,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
          ),
          child: Align(
            alignment: const Alignment(-1.1, -1.1),
            child: IconButton(
              onPressed: plusButtonPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
