class UserModel {
  final String name;
  final String surname;
  String password;
  String email;
  List userFavoriteCoins = [];

  UserModel(this.name, this.surname, this.password, this.email);
}
