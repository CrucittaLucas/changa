import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/view/body_favorites.dart';
import 'package:changa/src/view/body_home.dart';
import 'package:changa/src/view/body_user_perfil.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      const BodyHome(),
      const BodyFavorites(),
      Container(
        color: Colors.yellow,
      ),
      const BodyUserProfile(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          AppManager.backgroundColor,
          pages[_selectedItemIndex],
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppManager.colorContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 7,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Row(
          children: [
            itemBottomNavigationBar(
              context,
              Icons.home_outlined,
              0,
            ),
            itemBottomNavigationBar(
              context,
              Icons.favorite_border_outlined,
              1,
            ),
            itemBottomNavigationBar(
              context,
              Icons.notifications_outlined,
              2,
            ),
            itemBottomNavigationBar(
              context,
              Icons.person_outline,
              3,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBottomNavigationBar(
    BuildContext context,
    IconData iconData,
    int index,
  ) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedItemIndex = index;
      }),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        child: Icon(
          iconData,
          size: 35,
          color: index == _selectedItemIndex
              ? AppManager.colorGreenFluo
              : AppManager.colorTextContainer,
        ),
      ),
    );
  }
}
