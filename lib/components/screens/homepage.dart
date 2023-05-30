import 'package:flutter/material.dart';
import 'package:login/components/widgets/coin_widget.dart';
import 'package:login/models/coin.dart';
import 'package:login/utils/app_routes.dart';
import 'config_menu.dart';

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
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.CONFIG_MENU);
            },
          ),
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
