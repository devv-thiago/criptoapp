import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  

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
            color: Color.fromRGBO(183, 181, 228, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                    label: Text('Nome'),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text('E-mail'),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text('Senha'),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white),
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
                  child: const Text('Registrar-me'),
                ),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) {
                              return LoginPage();
                            },
                          )),
                      child: const Text('Já tenho uma conta',
                          style: TextStyle(color: Colors.purple))))
            ],
          ),
        ),
      ),
    );
  }
}
