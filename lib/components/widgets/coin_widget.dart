import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CoinWidget extends StatefulWidget {
  final String symbol;
  final String name;
  final String imageUrl;
  final double currentPrice;

  const CoinWidget(this.symbol, this.name, this.imageUrl, this.currentPrice,
      {Key? key})
      : super(key: key);

  @override
  State<CoinWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceinfo = MediaQuery.of(context);
    var formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return SizedBox(
      height: deviceinfo.size.height * 0.1,
      width: deviceinfo.size.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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
                    right: deviceinfo.size.width * 0.05,
                    left: deviceinfo.size.width * 0.02),
                height: deviceinfo.size.height * 0.13,
                width: deviceinfo.size.width * 0.13,
                child: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(188, 231, 253, 1),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.name,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.symbol.toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(formatter.format(widget.currentPrice).toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
