import 'package:flutter/material.dart';

import '../widgets/coin_widget.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> coins = [
      CoinWidget('Ethereum', 'ETH', '-10%', 'R\$20.000'),
      CoinWidget('Bitcoin', 'BTC', '-10%', 'R\$120.000'),
      CoinWidget('Ether', 'ET', '+10%', 'R\$15.000'),
      CoinWidget('Ethereum', 'ETH', '-10%', 'R\$20.000'),
    ];
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(42, 68, 148, 1),
        ),
        body: SizedBox(
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          child: Column(
            children: [
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
