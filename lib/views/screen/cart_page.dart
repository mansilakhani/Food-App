import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/product_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> addedProducts =
        Provider.of<ProductProvider>(context).addedProduct;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  " Add to Cart",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              height: 600,
              width: double.infinity,
              child: ListView.builder(
                itemCount: addedProducts.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      tileColor: Colors.green.withOpacity(0.2),
                      leading: Image.asset(
                        "${addedProducts[i].image}",
                        height: 50,
                        width: 50,
                      ),
                      title: Text(addedProducts[i].name),
                      subtitle: Text("Price: ${addedProducts[i].dummyPrice}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .addProduct(product: addedProducts[i]);
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text("   ${addedProducts[i].quantity}   "),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .removeProduct(product: addedProducts[i]);
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(
              flex: 16,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Products: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "${Provider.of<ProductProvider>(context).totalProducts}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "\$${Provider.of<ProductProvider>(context).totalPrice}",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            Spacer(
                //flex: 10,
                ),
          ],
        ),
      ),
    );
  }
}
