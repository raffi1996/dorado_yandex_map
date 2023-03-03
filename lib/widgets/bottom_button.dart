import 'package:flutter/material.dart';

import '../ui_utils/app_colors.dart';
import '../ui_utils/assets.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final bool selected;
  final int rubleCount;
  final double leftRadius;
  final double rightRadius;
  final VoidCallback onTap;

  const BottomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.selected = false,
    this.rubleCount = 1,
    this.leftRadius = 0,
    this.rightRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(selected ? Colors.purple : Colors.white),
        minimumSize: MaterialStateProperty.all(const Size(70, 52)),
        maximumSize: MaterialStateProperty.all(const Size(70, 52)),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        overlayColor: MaterialStateProperty.all(
          AppColors.shadowColor.withOpacity(0.090),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(leftRadius),
              right: Radius.circular(rightRadius),
            ),
            side: BorderSide.none,
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < rubleCount; ++i)
                Assets.rubleIcon.svg(
                  color: selected ? Colors.white : AppColors.purple,
                ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : AppColors.gray,
            ),
          )
        ],
      ),
    );
  }
}

//
// GestureDetector(
// onTap: onTap,
// child: Container(
// padding: const EdgeInsets.only(
// right: 15,
// left: 15,
// top: 10,
// bottom: 10,
// ),
// decoration: BoxDecoration(
// color: selected ? Colors.purple : Colors.white,
// borderRadius: BorderRadius.horizontal(
// left: Radius.circular(leftRadius),
// right: Radius.circular(rightRadius),
// ),
// ),
// child: Column(
// children: [
// Row(
// children: [
// for (var i = 0; i < rubleCount; ++i)
// Assets.rubleIcon.svg(
// color: selected ? Colors.white : AppColors.purple,
// ),
// ],
// ),
// const SizedBox(height: 3),
// Text(
// text,
// style: TextStyle(
// fontSize: 10,
// fontWeight: FontWeight.w500,
// color: selected ? Colors.white : AppColors.gray,
// ),
// )
// ],
// ),
// ),
// );
