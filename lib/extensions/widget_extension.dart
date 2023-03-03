import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget centerIcon({
    double width = 24,
    double height = 24,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: this,
      ),
    );
  }
}
