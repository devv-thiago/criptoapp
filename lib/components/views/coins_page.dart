import 'package:flutter/material.dart';
import 'package:login/components/widgets/coin_widget.dart'; // Importe o seu CoinWidget aqui
import 'package:login/services/coin_repository.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({Key? key}) : super(key: key);

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  CoinRepository coinProvider = CoinRepository();
  List<CoinWidget> coins = [];
  List<CoinWidget> filteredCoins = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCoins();
  }

  Future<void> _loadCoins() async {
    try {
      await coinProvider.getCoinInformation(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&sparkline=false&price_change_percentage=1h&locale=en&precision=2');
      setState(() {
        coins = coinProvider.cryptocurrencies.map((coin) {
          return CoinWidget(coin.symbol, coin.name, coin.imageUrl,
              coin.currentPrice, coin.priceChange);
        }).toList();
        filteredCoins = List.from(coins);
        // Inicialmente, exibimos todas as moedas
      });
    } catch (error) {
      throw Exception('Error to load coins, erro: $error');
    }
  }

  void _filterCoins(String searchTerm) {
    setState(() {
      filteredCoins = coins
          .where((coinWidget) =>
              (coinWidget)
                  .name
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase()) ||
              (coinWidget)
                  .symbol
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase()))
          .toList();
    });
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
        title: SizedBox(
          height: 40,
          child: TextField(
            controller: searchController,
            onChanged:
                _filterCoins, // Chama o filtro de moedas quando o texto da barra de pesquisa muda
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              suffixIcon: const Icon(Icons.search),
              fillColor: Colors.white,
              hintText: 'Search coins...',
              hintStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 15.0,
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(
            top: deviceInfo.size.height * 0.01,
            right: deviceInfo.size.height * 0.01,
            left: deviceInfo.size.height * 0.01,
          ),
          child: SizedBox(
            height: deviceInfo.size.height,
            width: deviceInfo.size.width,
            child: Column(
              children: [
                (filteredCoins.isEmpty)
                    ? Container(
                        height: deviceInfo.size.height * 0.3,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator())
                    : Expanded(
                        child: RefreshIndicator(
                            onRefresh: _loadCoins,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return filteredCoins[
                                    index]; // Exibe o CoinWidget correspondente
                              },
                              itemCount: filteredCoins.length,
                            )),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
