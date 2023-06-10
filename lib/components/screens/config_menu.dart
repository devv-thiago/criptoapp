import 'package:flutter/material.dart';

class ConfigMenu extends StatelessWidget {
  const ConfigMenu({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return SizedBox(
      height: deviceInfo.size.height,
      width: deviceInfo.size.width,
    );
  }
}
