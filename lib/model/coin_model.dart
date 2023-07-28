

class CoinModel {
  final String symbol;
  final String name;
  final String imageUrl;
  final double currentPrice;
  

  CoinModel(
      {required this.symbol,
      required this.name,
      required this.imageUrl,
      required this.currentPrice});

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
        symbol: json['symbol'],
        name: json['name'],
        imageUrl: json['image'],
        currentPrice: json['current_price']);
  }
}
