import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class FirebaseAuth {
  Future<void> registerUser(
      {required String email, required String password}) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDbMZPCbUQslPYBWCa2gBPMUnlQXQJG0Rs';
    final response = await post(
      Uri.parse(url),
      body: jsonEncode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );
    debugPrint(jsonDecode(response.body));
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDbMZPCbUQslPYBWCa2gBPMUnlQXQJG0Rs';
    final response = await post(Uri.parse(url),
        body: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    debugPrint(jsonDecode(response.body));
  }
}
