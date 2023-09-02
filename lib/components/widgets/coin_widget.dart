import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CoinWidget extends StatefulWidget {
  String symbol;
  String name;
  String imageUrl;
  double currentPrice;
  double priceChange;

  CoinWidget(this.symbol, this.name, this.imageUrl, this.currentPrice,
      this.priceChange);

  @override
  State<CoinWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceinfo = MediaQuery.of(context);
    var currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    var percentFormat =
        NumberFormat.decimalPercentPattern(decimalDigits: 2, locale: 'pt_BR');
    return SizedBox(
      height: deviceinfo.size.height * 0.1,
      width: deviceinfo.size.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Color.fromRGBO(42, 68, 148, 1),
              width: 3,
            )),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: deviceinfo.size.width * 0.03,
                    left: deviceinfo.size.width * 0.02),
                height: deviceinfo.size.height * 0.13,
                width: deviceinfo.size.width * 0.13,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: deviceinfo.size.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.symbol.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        widget.name,
                        softWrap: true,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    percentFormat.format(widget.priceChange).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: (widget.priceChange.isNegative)
                            ? Colors.red
                            : Colors.green),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  currencyFormat.format(widget.currentPrice).toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
