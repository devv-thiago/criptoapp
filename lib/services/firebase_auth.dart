import 'dart:convert';

import 'package:flutter/foundation.dart';
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
    debugPrint(response.body);
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey';
    final response = await post(Uri.parse(url),
        body: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    debugPrint(response.body);
  }
}