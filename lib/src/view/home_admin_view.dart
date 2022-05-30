import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/custom_admin_drawer.dart';
import 'package:flutter/material.dart';

class HomeAdminView extends StatelessWidget {
  const HomeAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: AppManager.colorDarkGreen,
        child: SafeArea(
          child: CustomAdminDrawer(),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppManager.colorDarkGreen,
        title: const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Center(
            child: Image(
              image: AssetImage(
                'assets/jober.png',
              ),
              width: 130,
            ),
          ),
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Especialidades',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: AppManager.colorGreen,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Hogar',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _SlotCategory(
                    imageCategory: 'assets/plomeria.png',
                    titleCategory: 'Plomería',
                    counterCategory: '43',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/gas.png',
                    titleCategory: 'Gas',
                    counterCategory: '45',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/electricidad.png',
                    titleCategory: 'Electricidad',
                    counterCategory: '50',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/cerrajeria.png',
                    titleCategory: 'Cerrajería',
                    counterCategory: '10',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/albanileria.png',
                    titleCategory: 'Albañilería',
                    counterCategory: '15',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/aire_acondicionado.png',
                    titleCategory: 'A. Acondi.',
                    counterCategory: '20',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/herreria.png',
                    titleCategory: 'Herrería',
                    counterCategory: '13',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/pisos.png',
                    titleCategory: 'Pisos',
                    counterCategory: '7',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/limpieza.png',
                    titleCategory: 'Limpieza',
                    counterCategory: '22',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Cuidado Personal',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _SlotCategory(
                    imageCategory: 'assets/estilista.png',
                    titleCategory: 'Estilista',
                    counterCategory: '17',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/manicura_new.png',
                    titleCategory: 'Manicura',
                    counterCategory: '33',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/pedicura.png',
                    titleCategory: 'Pedicura',
                    counterCategory: '33',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/masajes.png',
                    titleCategory: 'Masajes',
                    counterCategory: '27',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/personal_trainer.png',
                    titleCategory: 'P.Trainer',
                    counterCategory: '10',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Mascotas',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _SlotCategory(
                    imageCategory: 'assets/paseos.png',
                    titleCategory: 'Paseos',
                    counterCategory: '35',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/higiene.png',
                    titleCategory: 'Higiene',
                    counterCategory: '25',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/adiestrar.png',
                    titleCategory: 'Adiestrar',
                    counterCategory: '9',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Cuidado Personal',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _SlotCategory(
                    imageCategory: 'assets/educacion.png',
                    titleCategory: 'Educación',
                    counterCategory: '35',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/produccion.png',
                    titleCategory: 'Producción',
                    counterCategory: '19',
                  ),
                  _SlotCategory(
                    imageCategory: 'assets/asistencia.png',
                    titleCategory: 'Asistencia',
                    counterCategory: '15',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SlotCategory extends StatelessWidget {
  final String imageCategory;
  final String titleCategory;
  final String counterCategory;
  const _SlotCategory({
    Key? key,
    required this.imageCategory,
    required this.titleCategory,
    required this.counterCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.shortestSide / 3.6,
      width: screenSize.shortestSide / 3.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: AppManager.colorGreen,
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(imageCategory),
                const Spacer(),
                Text(titleCategory),
                const Spacer(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: AppManager.colorGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    10,
                  ),
                  topRight: Radius.circular(
                    10,
                  ),
                ),
              ),
              child: Center(
                child: Text(counterCategory),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
