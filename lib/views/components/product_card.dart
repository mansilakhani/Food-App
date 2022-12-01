import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:provider/provider.dart';
import 'package:statehandler_food_ordering_app/providers/product_provider.dart';

import '../../helpers/product_db_helper.dart';
import '../../models/product_model.dart';
import 'globals.dart';

class ProductCart_Page extends StatefulWidget {
  const ProductCart_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductCart_Page> createState() => _ProductCart_PageState();
}

class _ProductCart_PageState extends State<ProductCart_Page> {
  bool food = true;
  bool fruit = false;
  bool veg = false;
  bool grocery = false;

  late Future<RxList<Product>> productDataList;
  late Future<List<Product>> productList;

  void initState() {
    // TODO: implement initState
    super.initState();
    productList = ProductDBHelper.productDBHelper.fetchAllData();
    log(productList.toString(), name: "Product List Data");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  setState(() {
                    food = true;
                    fruit = false;
                    veg = false;
                    grocery = false;
                  });
                },
                child: Text(
                  "Food",
                  style: TextStyle(
                    color: (food) ? Colors.green : Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    food = false;
                    fruit = true;
                    veg = false;
                    grocery = false;
                  });
                },
                child: Text(
                  "Fruits",
                  style: TextStyle(
                    color: (fruit) ? Colors.green : Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    food = false;
                    fruit = false;
                    veg = true;
                    grocery = false;
                  });
                },
                child: Text(
                  "Vegetables",
                  style: TextStyle(
                    color: (veg) ? Colors.green : Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    food = false;
                    fruit = false;
                    veg = false;
                    grocery = true;
                  });
                },
                child: Text(
                  "Grocery",
                  style: TextStyle(
                    color: (grocery) ? Colors.green : Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 500,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (food) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 1,
                          context: context,
                          image: "assets/images/pasta.png",
                          name: "Pasta",
                          price: 100,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[0]);
                          },
                          plusButtonPressed: () {
                            log("plus Tapped");
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[0]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 2,
                          context: context,
                          image: "assets/images/dosa.png",
                          name: "Dosa",
                          price: 200,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[1]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[1]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 3,
                          context: context,
                          image: "assets/images/garlicbread.png",
                          name: "Garlic Bread",
                          price: 150,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[2]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[2]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 6,
                          context: context,
                          image: "assets/images/panipuri.png",
                          name: "PaniPuri",
                          price: 50,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[5]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[5]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 5,
                          context: context,
                          image: "assets/images/tacos.png",
                          name: "Tacos",
                          price: 250,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[4]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[4]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 4,
                          context: context,
                          image: "assets/images/salad.png",
                          name: "Winter Salad",
                          price: 180,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[3]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[3]);
                          },
                        ),
                      ],
                    ),
                  ),
                ] else if (fruit) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 7,
                          context: context,
                          image: "assets/images/fruitdish.png",
                          name: "Fruits Dish",
                          price: 200,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[6]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[6]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 8,
                          context: context,
                          image: "assets/images/watermelon.png",
                          name: "Watermelon",
                          price: 60,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[7]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[7]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      productContainer(
                        id: 9,
                        context: context,
                        image: "assets/images/strawberry.png",
                        name: "Strawberry",
                        price: 80,
                        onTap: () {
                          Navigator.pushNamed(context, "product_detail",
                              arguments: products[8]);
                        },
                        plusButtonPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .addProduct(product: products[8]);
                        },
                      ),
                    ],
                  ),
                ] else if (grocery) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 10,
                          context: context,
                          image: "assets/images/gro1.png",
                          name: "All Grocery",
                          price: 1000,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[9]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[9]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 11,
                          context: context,
                          image: "assets/images/gro2.png",
                          name: "Mix Grocery",
                          price: 800,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[10]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[10]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 12,
                          context: context,
                          image: "assets/images/gro3.png",
                          name: "Basic Grocery",
                          price: 300,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[11]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[11]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 13,
                          context: context,
                          image: "assets/images/gro4.png",
                          name: "Crude Grocery",
                          price: 150,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[12]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[12]);
                          },
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            productContainer(
                              id: 13,
                              context: context,
                              image: "assets/images/cabbage.png",
                              name: "Cabbage",
                              price: 40,
                              onTap: () {
                                Navigator.pushNamed(context, "product_detail",
                                    arguments: products[12]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .addProduct(product: products[12]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 11,
                              context: context,
                              image: "assets/images/veg.png",
                              name: "Mix Veges",
                              price: 90,
                              onTap: () {
                                Navigator.pushNamed(context, "product_detail",
                                    arguments: products[12]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .addProduct(product: products[12]);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 11,
                          context: context,
                          image: "assets/images/veg1.png",
                          name: "Green Vegetables",
                          price: 70,
                          onTap: () {
                            Navigator.pushNamed(context, "product_detail",
                                arguments: products[12]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[12]);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
