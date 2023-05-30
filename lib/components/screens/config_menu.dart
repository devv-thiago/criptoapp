import 'package:flutter/material.dart';

class ConfigMenu extends StatelessWidget {
  const ConfigMenu({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        body: SizedBox(
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.amber,
                  ),
                  Text('Thiago Fofano')
                ],
              ),
              SizedBox(
                height: deviceInfo.size.height * 0.05,
              ),
              Container(
                  height: deviceInfo.size.height * 0.08,
                  width: deviceInfo.size.width,
                  decoration: const BoxDecoration(color: Colors.red),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: InkWell(
                      child: const Text('Minhas configuracoes'),
                      onTap: () => print('clicou'),
                    ),
                  )),
              Container(
                height: deviceInfo.size.height * 0.08,
                width: deviceInfo.size.width,
                decoration: const BoxDecoration(color: Colors.yellow),
              ),
              Container(
                height: deviceInfo.size.height * 0.08,
                width: deviceInfo.size.width,
                decoration: const BoxDecoration(color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
