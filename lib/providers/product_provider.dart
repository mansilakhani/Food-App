import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> addedProduct = [];

  get totalPrice {
    double price = 0.0;
    for (Product product in addedProduct) {
      price = (price + (product.price * product.quantity));
    }
    return price;
  }

  get totalProducts {
    int products = 0;
    for (Product product in addedProduct) {
      products = products + product.quantity;
    }
    return products;
  }

  void addProduct({required Product product}) {
    int flag = 0;
    for (Product addProduct in addedProduct) {
      if (addProduct.id == product.id) {
        product.quantity = product.quantity + 1;
        addProduct.dummyPrice = addProduct.price * product.quantity;
        flag = 1;
        notifyListeners();
      }
      notifyListeners();
    }
    if (flag == 0) {
      addedProduct.add(product);
      notifyListeners();
    }
  }

  likeProduct({required Product product}) {
    if (product.isLike == "false") {
      product.isLike = "true";
      notifyListeners();
    } else {
      product.isLike = "false";
      notifyListeners();
    }
  }

  void removeProduct({required Product product}) {
    if (product.quantity > 1) {
      product.quantity = product.quantity - 1;
      product.dummyPrice = product.price * product.quantity;
      notifyListeners();
    } else {
      addedProduct.remove(product);
      notifyListeners();
    }
  }
}
