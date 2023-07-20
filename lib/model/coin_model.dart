
class CoinModel {
  final String id;
  final String symbol;
  final String name;
  final Map<String, dynamic> platforms;

  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.platforms,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      platforms: Map<String, dynamic>.from(json['platforms']),
    );
  }
}
 