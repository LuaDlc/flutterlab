// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product implements Comparable<Product> {
  final String id;
  final String name;
  final String category;
  final double price;
  final int quantity;
  final bool active;
  final DateTime createdAt;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.quantity,
    required this.active,
    required this.createdAt,
  });

  double get totalValue => price * quantity;

  @override
  int compareTo(Product other) {
    return name.compareTo(other.name);
  }
}
