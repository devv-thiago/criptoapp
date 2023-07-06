import 'dart:convert';


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class FirebaseAuth {
  var apiKey = dotenv.env['FIREBASE_KEY'];
  Future<void> registerUser(
      {required String email, required String password}) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey';
    final response = await post(
      Uri.parse(url),
      body: jsonEncode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );
  }

  Future loginUser({required String email, required String password}) async {
    String userExist = '';
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey';
    final response = await post(Uri.parse(url),
        body: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    if (response.statusCode == 200) {
      userExist = 'ok';
    }
    return userExist;
  }
}
