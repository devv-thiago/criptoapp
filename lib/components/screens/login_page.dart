import 'package:flutter/material.dart';
import 'package:login/utils/app_routes.dart';

import '../../services/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth();
  bool _validated = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    goHomePage() {
      Navigator.pushReplacementNamed(context, AppRoutes.HOMEPAGE);
    }

    showAlertDialog() {
      // set up the button
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        content: const Text("Usuário não existente"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return MaterialApp(
        home: Scaffold(
            body: Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 251, 254, 1),
        border: Border.all(color: Colors.transparent),
      ),
      height: deviceInfo.size.height,
      width: deviceInfo.size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(50.0),
              ),
              labelText: 'E-mail',
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            obscureText: isObscure,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(50.0),
              ),
              labelText: 'Senha',
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure == true
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: (_validated == false) ? 50 : deviceInfo.size.height * 0.05,
            width: (_validated == false)
                ? deviceInfo.size.width
                : deviceInfo.size.width * 0.1,
            child: (_validated == false)
                ? ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(42, 68, 148, 1))),
                    onPressed: () async {
                      setState(() {
                        _validated = true;
                      });
                      var loginStatus = await auth.loginUser(
                          email: emailController.text,
                          password: passwordController.text);
                      if (loginStatus == 'ok') {
                        goHomePage();
                      } else {
                        setState(() {
                          _validated = false;
                        });
                        showAlertDialog();
                      }
                    },
                    child: const Text('Login'),
                  )
                : const CircularProgressIndicator(),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
            ),
            width: deviceInfo.size.width,
            height: deviceInfo.size.height * 0.05,
            alignment: Alignment.bottomRight,
            child: TextButton(
                child: const Text(
                  'Não tem uma conta? registre-se',
                  style: TextStyle(color: Color.fromRGBO(42, 68, 148, 1)),
                ),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, AppRoutes.REGISTER_PAGE)),
          )
        ],
      ),
    )));
  }
}
