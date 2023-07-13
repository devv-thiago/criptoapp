class CoinModel {
  final int id;
  final String name;
  final String imagePath;
  int preco;
  bool isFavorite = false;

  CoinModel(this.id, this.name, this.imagePath, this.preco);
}
