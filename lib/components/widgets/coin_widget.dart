import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinWidget extends StatefulWidget {
  final String id;
  final String symbol;
  final String name;
  final String imageUrl;
  final String currentPrice;

  const CoinWidget(
      this.id, this.symbol, this.name, this.imageUrl, this.currentPrice,
      {Key? key})
      : super(key: key);

  @override
  State<CoinWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceinfo = MediaQuery.of(context);
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
              SizedBox(
                height: deviceinfo.size.height * 0.15,
                width: deviceinfo.size.width * 0.15,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(child: Text(widget.id)),
              Expanded(child: Text(widget.symbol)),
              Expanded(child: Text(widget.name)),
              Expanded(child: Text(widget.currentPrice)),
            ],
          ),
        ),
      ),
    );
  }
}
