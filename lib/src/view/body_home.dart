import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/end_drawer.dart';
import 'package:changa/src/widgets/info_requestor_card.dart';

import 'package:flutter/material.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      endDrawer: Drawer(
        backgroundColor: AppManager.colorDarkGreen,
        width: screenSize.shortestSide / 1.5,
        child: ColumnEndDrawer(screenSize: screenSize),
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hola Francisco!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Actualiza tus filtros para ver las mejores ofertas',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorGreen,
              iconData: Icons.favorite_border_outlined,
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorGreen,
              iconData: Icons.favorite_border_outlined,
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorGreen,
              iconData: Icons.favorite_border_outlined,
            ),
            const InfoRequestorCard(
              iconColor: AppManager.colorGreen,
              iconData: Icons.favorite_border_outlined,
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
