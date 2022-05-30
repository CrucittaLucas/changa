import 'package:changa/src/bll/app_manager.dart';
import 'package:flutter/material.dart';

class StarAndNumber extends StatelessWidget {
  const StarAndNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
