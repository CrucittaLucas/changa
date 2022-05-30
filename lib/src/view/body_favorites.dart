import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/end_drawer.dart';
import 'package:changa/src/widgets/info_requestor_card.dart';

import 'package:flutter/material.dart';

class BodyFavorites extends StatelessWidget {
  const BodyFavorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      endDrawer: Drawer(
        child: ColumnEndDrawer(screenSize: screenSize),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Solicitudes Favoritas',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Postulate como candidato',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorOrange,
              iconData: Icons.favorite,
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorOrange,
              iconData: Icons.favorite,
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorOrange,
              iconData: Icons.favorite,
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorOrange,
              iconData: Icons.favorite,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.shortestSide * 0.1,
      width: screenSize.shortestSide * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: const Image(
          image: AssetImage(
            'assets/ladolfina.png',
          ),
        ),
      ),
    );
  }
}
