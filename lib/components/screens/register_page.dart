import 'package:flutter/material.dart';

import '../../services/firebase_auth.dart';
import '../../utils/app_routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth();
  bool _validated = false;
  goToLoginPage() {
    Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_PAGE);
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
      content: const Text("Usuário existente"),
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 251, 254, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: const Text('Nome'),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    label: const Text('E-mail'),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: senhaController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    label: const Text('Senha'),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height:
                    (_validated == false) ? 50 : deviceInfo.size.height * 0.05,
                width: (_validated == false)
                    ? deviceInfo.size.width
                    : deviceInfo.size.width * 0.1,
                child: (_validated == false)
                    ? ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(42, 68, 148, 1))),
                        onPressed: () async {
                          setState(() {
                            _validated = true;
                          });
                          var result = await auth.validateData(
                              email: emailController.text,
                              password: senhaController.text);
                          if (result == 'usuário habilitado') {
                            await auth.registerUser(
                                email: emailController.text,
                                password: senhaController.text);
                            goToLoginPage();
                          } else {
                            setState(() {
                              _validated = false;
                            });
                            showAlertDialog();
                          }
                        },
                        child: const Text('Registrar-me'),
                      )
                    : const CircularProgressIndicator(),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.LOGIN_PAGE),
                      child: const Text('Já tenho uma conta',
                          style: TextStyle(
                              color: Color.fromRGBO(42, 68, 148, 1)))))
            ],
          ),
        ),
      ),
    );
  }
}
