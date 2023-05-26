import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
        home: Scaffold(
            body: Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(183, 181, 228, 1),
        border: Border.all(color: Colors.transparent),
      ),
      height: deviceInfo.size.height,
      width: deviceInfo.size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'E-mail',
              prefixIcon: Icon(
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
              border: const OutlineInputBorder(),
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
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.no_encryption)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: deviceInfo.size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(131, 50, 172, 1))),
              onPressed: () {},
              child: const Text('Login'),
            ),
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
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return const RegisterPage();
                },
              )),
            ),
          ),
        ],
      ),
    )));
  }
}
