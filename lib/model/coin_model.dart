class CoinModel {
  String symbol;
  String name;
  String imageUrl;
  double currentPrice;
  double priceChange;

  CoinModel(
      {required this.symbol,
      required this.name,
      required this.imageUrl,
      required this.currentPrice,
      required this.priceChange,
      });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
        symbol: json['symbol'],
        name: json['name'],
        imageUrl: json['image'],
        currentPrice: json['current_price'],
        priceChange: json['price_change_percentage_24h']);
  }

}
