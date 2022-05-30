import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/view/body_home.dart';
import 'package:changa/src/widgets/star_numbre.dart';
import 'package:flutter/material.dart';

class InfoRequestorCard extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  const InfoRequestorCard({
    Key? key,
    required this.iconColor,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          color: AppManager.colorContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              // horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: rowInfoBuilder(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: chipRowBuilder(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: elevatedButtonBuilder(screenSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row elevatedButtonBuilder(Size screenSize) {
    return Row(
      children: [
        SizedBox(
          width: screenSize.width * 0.6,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              primary: AppManager.colorOrange,
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'POSTULARME',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                Icon(Icons.file_upload_outlined)
              ],
            ),
          ),
        ),
        const Spacer(),
        Icon(
          iconData,
          color: iconColor,
          size: 35,
        ),
      ],
    );
  }

  SingleChildScrollView chipRowBuilder() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Wrap(
          spacing: 10,
          children: [
            chiCategoryBuilder(
              'Changa partido',
              AppManager.colorGreen,
              AppManager.colorDarkGreen,
            ),
            chiCategoryBuilder(
              'Aseo y Mantenimiento',
              AppManager.colorGreen,
              AppManager.colorDarkGreen,
            ),
            chiCategoryBuilder(
              'Limpieza',
              AppManager.colorGreen,
              AppManager.colorDarkGreen,
            ),
          ],
        ),
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

  Row rowInfoBuilder() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomCircleAvatar(),
        const Spacer(),
        Column(
          children: const [
            Text(
              'La Dolfina',
              style: TextStyle(
                color: AppManager.colorGreenFluo,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '15/07/22',
              style: TextStyle(
                  color: AppManager.colorGreenFluo,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: .5),
            ),
          ],
        ),
        const Spacer(),
        const Text(
          '08:00 AM',
          style: TextStyle(
            color: AppManager.colorGreenFluo,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            // letterSpacing: .5,
          ),
        ),
        const Spacer(),
        Column(
          children: const [
            StarAndNumber(),
            SizedBox(height: 10),
            Text(
              '15/07/22',
              style: TextStyle(
                  color: AppManager.colorGreenFluo,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: .5),
            ),
          ],
        ),
      ],
    );
  }
}
