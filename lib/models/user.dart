import 'package:login/models/coin.dart';

class User {
  final String name;
  final String surname;
  String password;
  String email;
  List<Coin> userFavoriteCoins = [];

  User(this.name, this.surname, this.password, this.email);
}
