class CoinModel {
  final String id;
  final String symbol;
  final String name;
  final String imageUrl;
  final String currentPrice;

  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.imageUrl,
    required this.currentPrice
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      imageUrl: json['image'],
      currentPrice: json['current_price']
    );
  }
}
