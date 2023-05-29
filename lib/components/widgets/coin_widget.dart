import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  String name;

  String id;

  String percent;

  String price;

  CoinWidget(this.name, this.id, this.percent, this.price);

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceinfo = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
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
                  Text(name),
                  Text(id),
                ],
              ),
              SizedBox(
                width: deviceinfo.size.width * 0.1,
              ),
              Text(percent),
              SizedBox(
                width: deviceinfo.size.width * 0.05,
              ),
              Text(price),
            ],
          ),
        ),
      ),
    );
  }
}
