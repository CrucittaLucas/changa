import 'package:flutter/material.dart';

class SlotCategory extends StatelessWidget {
  final String nameCategory;
  final Color colorSlot;
  final Widget imageSlot;
  const SlotCategory({
    Key? key,
    required this.nameCategory,
    required this.colorSlot,
    required this.imageSlot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double slotSize = size.shortestSide * 0.25;
    return Container(
      padding: const EdgeInsets.all(5),
      height: slotSize,
      width: slotSize,
      decoration: BoxDecoration(
        color: colorSlot,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            child: imageSlot,
          ),
          const Spacer(),
          (nameCategory == '')
              ? Container()
              : Text(
                  nameCategory,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
        ],
      ),
    );
  }
}
