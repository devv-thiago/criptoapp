import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: deviceInfo.size.height * 0.13,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: const Color.fromRGBO(42, 68, 148, 1),
        title: const Text(
          'News',
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: SizedBox(
        height: deviceInfo.size.height,
        width: deviceInfo.size.width,
      ),
    );
  }
}
