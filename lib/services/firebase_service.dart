
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  FirebaseService();

  insertData(String name, String email, String senha) async {
    try {
      await ref.set({
        name: {
          'email': email,
          'senha': senha,
        }
      });
      print('Registro inserido');
    } catch (e) {
      Exception('Erro: $e');
    }
  }
}
