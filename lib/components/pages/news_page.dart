import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(42, 68, 148, 1),
        title: const Text('News'),
      ),
      body: SizedBox(
        height: deviceInfo.size.height,
        width: deviceInfo.size.width,
      ),
    );
  }
}
