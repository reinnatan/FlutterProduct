class Product{
  final int id;
  final String name;
  final String category;
  final int price;

  Product(this.id, this.name, this.category, this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(json['id'], json['name'], json['category'], json['price']);
  }
}