import 'package:flutter/material.dart';
import 'package:login/components/widgets/coin_widget.dart';
import 'package:login/models/coin.dart';
import '../widgets/drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> coins = [
    CoinWidget('Ethereum', 'ETH', '-10%', 'R\$20.000'),
    CoinWidget('Bitcoin', 'BTC', '-10%', 'R\$120.000'),
    CoinWidget('Ether', 'ET', '+10%', 'R\$15.000'),
    CoinWidget('Ethereum', 'ETH', '-10%', 'R\$20.000'),
    CoinWidget('Bitcoin', 'BTC', '-10%', 'R\$120.000'),
    CoinWidget('Ether', 'ET', '+10%', 'R\$15.000'),
    CoinWidget('Ethereum', 'ETH', '-10%', 'R\$20.000'),
    CoinWidget('Bitcoin', 'BTC', '-10%', 'R\$120.000'),
    CoinWidget('Ether', 'ET', '+10%', 'R\$15.000'),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        drawer: const Drawer(
          child: DrawerMenu()
        ),
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          backgroundColor: const Color.fromRGBO(42, 68, 148, 1),
          title: const Center(child: Text('Cripto App')),
        ),
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        body: SizedBox(
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 30),
                height: deviceInfo.size.height * 0.06,
                child: const SearchBar(
                  leading: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return coins[index];
                  },
                  itemCount: coins.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
