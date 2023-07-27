import 'package:flutter/material.dart';
import 'package:login/components/widgets/coin_widget.dart'; // Importe o seu CoinWidget aqui
import 'package:login/services/coin_provider.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  bool allClicked = false;
  bool favoriteClicked = false;
  CoinProvider coinProvider = CoinProvider();
  List<Widget> coins = [];

  @override
  void initState() {
    super.initState();
    _loadCoins(); // Chama a função para carregar os dados das criptomoedas
  }

  Future<void> _loadCoins() async {
    try {
      await coinProvider.getCoinInformation(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=10&sparkline=false&locale=en&precision=2');
      setState(() {
        // Cria os widgets do CoinWidget para cada moeda carregada
        coins = coinProvider.cryptocurrencies.map((coin) {
          return CoinWidget(
              // Use o seu CoinWidget aqui
              coin.id,
              coin.symbol,
              coin.name,
              coin.imageUrl,
              coin.currentPrice);
        }).toList();
      });
    } catch (error) {
      // Lida com possíveis erros na chamada da API
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(42, 68, 148, 1),
        toolbarHeight: deviceInfo.size.height * 0.13,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: deviceInfo.size.height * 0.05,
          right: deviceInfo.size.height * 0.01,
          left: deviceInfo.size.height * 0.01,
        ),
        child: SizedBox(
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          child: Column(
            children: [
              Row(
                children: [
                  ActionChip(
                    onPressed: () async {
                      setState(() {
                        allClicked = !allClicked;
                      });
                    },
                    disabledColor: Colors.transparent,
                    label: Text(
                      'All',
                      style: TextStyle(
                        color:
                            (allClicked == false) ? Colors.black : Colors.white,
                      ),
                    ),
                    backgroundColor: (allClicked == false)
                        ? Colors.transparent
                        : const Color.fromRGBO(42, 68, 148, 1),
                    side: const BorderSide(
                      color: Color.fromRGBO(42, 68, 148, 1),
                      width: 2,
                    ),
                  ),
                  ActionChip(
                    onPressed: () {
                      setState(() {
                        favoriteClicked = !favoriteClicked;
                      });
                    },
                    disabledColor: Colors.transparent,
                    backgroundColor: (favoriteClicked == false)
                        ? Colors.transparent
                        : const Color.fromRGBO(42, 68, 148, 1),
                    label: Text(
                      'Favorites',
                      style: TextStyle(
                        color: (favoriteClicked == false)
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    side: const BorderSide(
                      color: Color.fromRGBO(42, 68, 148, 1),
                      width: 2,
                    ),
                  ),
                ],
              ),
              (coins.isEmpty)
                  ? Container(
                      height: deviceInfo.size.height * 0.3,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return coins[
                              index]; // Exibe o CoinWidget correspondente
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
