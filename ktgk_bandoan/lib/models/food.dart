class Food {
  final int id;
  final String name;
  final double price;
  final String image;
  final String category;
  final String description;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
      description: json['description'],
    );
  }
}