import 'package:login/model/coin_model.dart';

class UserModel {
  final String name;
  final String surname;
  String password;
  String email;
  List<CoinModel> userFavoriteCoins = [];

  UserModel(this.name, this.surname, this.password, this.email);
}
