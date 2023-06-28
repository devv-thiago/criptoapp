import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class FirebaseService {
  FirebaseDatabase database =
      FirebaseDatabase.instance; // instancia padrao do banco de dados
  DatabaseReference ref = FirebaseDatabase.instance.ref('users');
  // instância de DatabaseReference(necessario)
  String baseUrl = 'https://criptoapp-1bab3-default-rtdb.firebaseio.com/';

  getData() async {
    var json = await http.get(Uri.parse('$baseUrl/users'));
    print(json.body);
  }

  Future<void> insertData(
      {required String nome,
      required String email,
      required String senha}) async {
    await ref.push().set({
      "nome": nome,
      "email": email,
      "senha": senha,
    });
  }
}
