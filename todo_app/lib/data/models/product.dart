class Product {
  int id;
  String title;
  String desc;
  String image;
  String slug;
  int price;
  // String phone;

  Product({this.id, this.title, this.desc, this.image, this.slug, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      image: json['image'],
      slug: json['slug'],
      price: json['price'],
    );
  }
}
