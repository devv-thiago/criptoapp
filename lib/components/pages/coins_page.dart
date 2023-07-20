import 'package:flutter/material.dart';

import '../widgets/coin_widget.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  bool allClicked = false;
  bool favoriteClicked = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> coins = [

    ];
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(42, 68, 148, 1),
          toolbarHeight: deviceInfo.size.height * 0.13,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: deviceInfo.size.height * 0.05,
              right: deviceInfo.size.height * 0.01,
              left: deviceInfo.size.height * 0.01),
          child: SizedBox(
            height: deviceInfo.size.height,
            width: deviceInfo.size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    ActionChip(
                      onPressed: () {
                        setState(() {
                          allClicked = !allClicked;
                        });
                      },
                      disabledColor: Colors.transparent,
                      label: Text(
                        'All',
                        style: TextStyle(
                            color: (allClicked == false)
                                ? Colors.black
                                : Colors.white),
                      ),
                      backgroundColor: (allClicked == false)
                          ? Colors.transparent
                          : const Color.fromRGBO(42, 68, 148, 1),
                      side: const BorderSide(
                          color: Color.fromRGBO(42, 68, 148, 1), width: 2),
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
                                : Colors.white),
                      ),
                      side: const BorderSide(
                          color: Color.fromRGBO(42, 68, 148, 1), width: 2),
                    ),
                  ],
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
      ),
    );
  }
}
