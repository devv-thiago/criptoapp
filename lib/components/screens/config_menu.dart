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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: deviceInfo.size.height * 0.3,
                width: deviceInfo.size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amber,
                    ),
                    SizedBox(
                      height: deviceInfo.size.height * 0.02,
                    ),
                    const Text('Thiago Fofano')
                  ],
                ),
              ),
              SizedBox(
                height: deviceInfo.size.height * 0.7,
                width: deviceInfo.size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                right: deviceInfo.size.width * 0.05),
                            child: const Icon(Icons.settings)),
                        InkWell(
                            child: const Text('Meu perfil'),
                            onTap: () => print('clicou')),
                      ],
                    ),
                    SizedBox(
                      height: deviceInfo.size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                right: deviceInfo.size.width * 0.05),
                            child: const Icon(Icons.settings)),
                        InkWell(
                            child: const Text('Meu perfil'),
                            onTap: () => print('clicou')),
                      ],
                    ),
                    SizedBox(
                      height: deviceInfo.size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                right: deviceInfo.size.width * 0.05),
                            child: const Icon(Icons.settings)),
                        InkWell(
                            child: const Text('Meu perfil'),
                            onTap: () => print('clicou')),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
