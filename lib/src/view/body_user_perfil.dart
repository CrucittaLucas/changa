import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/end_drawer.dart';
import 'package:changa/src/widgets/gradient.dart';
import 'package:flutter/material.dart';

class BodyUserProfile extends StatelessWidget {
  const BodyUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: AppManager.colorDarkGreen,
        width: screenSize.shortestSide / 1.5,
        child: ColumnEndDrawer(screenSize: screenSize),
      ),
      // backgroundColor: AppManager.colorContainer,
      body: Stack(
        children: [
          const CustomGradient(),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  flexibleSpace: Stack(
                    children: [
                      const Image(
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/cuidador_changa.png',
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black,
                              Colors.black12,
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 2,
                          color: AppManager.colorOrange,
                        ),
                      ),
                    ],
                  ),
                  expandedHeight: screenSize.height / 2.7,
                  title: Column(
                    children: [
                      Center(
                        child: Image(
                          width: screenSize.width / 2.5,
                          image: const AssetImage(
                            'assets/changa_logo.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: [
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
                                  'Biografía',
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    'Radio de acción',
                                    style: TextStyle(
                                      color: AppManager.colorGreenFluo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 10,
                                    children: [
                                      chipKmBuilder(
                                        '5 km',
                                        AppManager.colorContainer,
                                        AppManager.colorRose,
                                      ),
                                      chipKmBuilder(
                                        '10 km',
                                        AppManager.colorContainer,
                                        AppManager.colorRose,
                                      ),
                                      chipKmBuilder(
                                        '20 km',
                                        AppManager.colorContainer,
                                        AppManager.colorRose,
                                      ),
                                      chipKmBuilder(
                                        '+20 km',
                                        AppManager.colorTextContainer,
                                        AppManager.colorContainer,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    'Filtro de solicitudes',
                                    style: TextStyle(
                                      color: AppManager.colorGreenFluo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 10,
                                    children: [
                                      chiCategoryBuilder(
                                        'Changa y partido',
                                        AppManager.colorTextContainer,
                                        AppManager.colorRose,
                                      ),
                                      chiCategoryBuilder(
                                        'Aseo y Mantenimiento',
                                        AppManager.colorTextContainer,
                                        AppManager.colorRose,
                                      ),
                                      chiCategoryBuilder(
                                        'Limpieza',
                                        AppManager.colorTextContainer,
                                        AppManager.colorRose,
                                      ),
                                      chiCategoryBuilder(
                                        'Tramsporte',
                                        AppManager.colorContainer,
                                        AppManager.colorRose,
                                      ),
                                      chiCategoryBuilder(
                                        'Nanny',
                                        AppManager.colorTextContainer,
                                        AppManager.colorRose,
                                      ),
                                      chiCategoryBuilder(
                                        'Babysitting',
                                        AppManager.colorContainer,
                                        AppManager.colorRose,
                                      ),
                                      chiCategoryBuilder(
                                        'Piloto',
                                        AppManager.colorTextContainer,
                                        AppManager.colorRose,
                                      ),
                                      chiCategoryBuilder(
                                        'Asador',
                                        AppManager.colorTextContainer,
                                        AppManager.colorRose,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Chip chipKmBuilder(
    String textChip,
    Color colorChip,
    Color textColor,
  ) {
    return Chip(
      backgroundColor: colorChip,
      label: Text(textChip),
      labelStyle: TextStyle(
        color: textColor,
        fontSize: 12,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
    );
  }

  Chip chiCategoryBuilder(
    String textChip,
    Color colorChip,
    Color textColor,
  ) {
    return Chip(
      backgroundColor: colorChip,
      label: Text(textChip),
      labelStyle: TextStyle(
        color: textColor,
        fontSize: 12,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
    );
  }
}
