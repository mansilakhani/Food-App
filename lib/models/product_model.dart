class Product {
  int id;
  String name;
  double price;
  String image;
  int quantity;
  String isLike;
  double dummyPrice;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.isLike,
    required this.image,
    required this.dummyPrice,
  });

  factory Product.fromMap({required Map data}) {
    return Product(
      id: data["id"],
      name: data["name"],
      price: data["price"],
      image: data["image"],
      quantity: data["quantity"],
      dummyPrice: data["dummyPrice"],
      isLike: data["isLike"],
    );
  }
}
