class CartItem {
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
    required this.imageUrl,
  });
}
