import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinWidget extends StatefulWidget {
  String name;
  String id;

  String percent;

  String price;

  CoinWidget(this.name, this.id, this.percent, this.price, {super.key});

  @override
  State<CoinWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceinfo = MediaQuery.of(context);
    return Container(
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
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(
                width: deviceinfo.size.width * 0.05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.name),
                  Text(widget.id),
                ],
              ),
              SizedBox(
                width: deviceinfo.size.width * 0.1,
              ),
              Text(widget.percent),
              SizedBox(
                width: deviceinfo.size.width * 0.05,
              ),
              Text(widget.price),
            ],
          ),
        ),
      ),
    );
  }
}
