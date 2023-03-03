import 'package:dorado_map/ui_utils/app_colors.dart';
import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? child;
  final double? width;
  final double? height;
  final double paddingAll;

  const MapButton({
    Key? key,
    required this.onTap,
    this.child,
    this.width,
    this.height,
    this.paddingAll = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 24,
            color: AppColors.shadowColor.withOpacity(.15),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all(const Size(52, 52)),
          maximumSize: MaterialStateProperty.all(const Size(52, 52)),
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
          overlayColor: MaterialStateProperty.all(
            AppColors.shadowColor.withOpacity(0.090),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide.none,
            ),
          ),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: child,
      ),
    );
  }
}
