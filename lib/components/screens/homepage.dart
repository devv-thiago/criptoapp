import 'package:flutter/material.dart';
import 'package:login/components/screens/coins_page.dart';
import 'package:login/components/screens/config_menu.dart';
import 'package:login/components/screens/news_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> navigatorPages = [
    CoinsPage(),
    NewsPage(),
    ConfigMenu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        body: navigatorPages[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(42, 68, 148, 1),
            currentIndex: _selectedIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper_outlined,
                  color: Colors.white,
                ),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: 'My account',
              ),
            ],
            onTap: _onItemTapped,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromRGBO(106, 141, 146, 1),
            iconSize: 30,
            unselectedFontSize: 13,
            selectedFontSize: 15,
          ),
        ),
      ),
    );
  }
}
