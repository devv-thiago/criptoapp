import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  FirebaseDatabase database =
      FirebaseDatabase.instance; // instancia padrao do banco de dados
  DatabaseReference ref = FirebaseDatabase.instance
      .ref('/users'); // instância de DatabaseReference(necessario)

  Future<void> insertData(
      {required String nome,
      required String email,
      required String senha}) async {
    await ref.set({
      nome: {
        "email": email,
        "senha": senha,
      }
    });
  }
}
