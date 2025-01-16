class DrinkItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  String size;
  String sugar;

  DrinkItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.size = 'Small',
    this.sugar = 'Regular'
  });
}