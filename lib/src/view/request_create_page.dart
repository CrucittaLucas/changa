import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/end_drawer.dart';
import 'package:flutter/material.dart';

class RequestCreatePage extends StatelessWidget {
  const RequestCreatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image(
            width: screenSize.width / 2.5,
            image: const AssetImage(
              'assets/changa_logo.png',
            ),
          ),
        ),
        // toolbarHeight: 100,
        backgroundColor: Colors.black,
      ),
      endDrawer: Drawer(
        backgroundColor: AppManager.colorDarkGreen,
        width: screenSize.shortestSide / 1.5,
        child: ColumnEndDrawer(screenSize: screenSize),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AppManager.backgroundColor,
          ListView(
            children: [
              SizedBox(
                height: screenSize.height / 3,
                // width: double.infinity,
                child: Stack(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/ladolfina_1.png',
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.01, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black,
                            Colors.black38,
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                  border: Border.all(
                                    width: 1.5,
                                    color: AppManager.colorRose,
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star_outline,
                                      color: AppManager.colorRose,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '+100 solicitudes generadas',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Row(
                            children: const [
                              Text(
                                'La Dolfina',
                                style: TextStyle(
                                  color: AppManager.colorTextOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.photo_camera_outlined,
                                color: AppManager.colorGreenFluo,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1.5,
                          color: AppManager.colorTextOrange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  infoChangaBuil(screenSize, '15/07/22'),
                  infoChangaBuil(screenSize, '08:00 AM'),
                  infoChangaBuil(screenSize, '\$50'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Descripción de la solicitud',
                        style: TextStyle(
                          color: AppManager.colorGreenFluo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppManager.colorContainer,
                      ),
                      child: const Text(
                        'Veniam sunt velit cupidatat laborum. Sit aliquip anim veniam eiusmod et elit culpa anim. Nulla culpa in proident commodo labore irure sunt excepteur dolor nulla incididunt veniam commodo. Magna ullamco deserunt id do exercitation qui quis anim pariatur id reprehenderit voluptate cupidatat. Non ea fugiat tempor mollit excepteur. Deserunt sit quis esse enim aliqua reprehenderit in dolor cillum amet aliquip. Aliquip nostrud consequat et dolor velit mollit consectetur officia et ea.',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox infoChangaBuil(
    Size screenSize,
    String fecha,
  ) {
    return SizedBox(
      width: screenSize.width / 3,
      child: Center(
        child: Text(
          fecha,
          style: const TextStyle(
            color: AppManager.colorGreenFluo,
          ),
        ),
      ),
    );
  }
}
