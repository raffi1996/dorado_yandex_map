import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Assets {
  Assets._();

  static const zoomIcon = 'assets/icons/zoom.svg';
  static const zoomOutIcon = 'assets/icons/zoom_out.svg';
  static const currentLocation = 'assets/icons/current_location.svg';
  static const qrIcon = 'assets/icons/qr_icon.svg';
  static const rubleIcon = 'assets/icons/ruble_icon.svg';
  static const searchIcon = 'assets/icons/search_icon.svg';
  static const burgerMenu = 'assets/icons/burger_menu.svg';
  static const bellHopIcon = 'assets/icons/bellhop_bell.png';
  static const cupMarker = 'assets/icons/cap_marker.svg';
  static const caffeIcon = 'assets/icons/caffe.svg';
  static const restaurant = 'assets/icons/restaurant.svg';
  static const broomIcon = 'assets/icons/broom.png';
  static const saxophoneIcon = 'assets/icons/saxophone.png';
  static const starIcon = 'assets/icons/star.png';
  static const yandexMap = 'assets/icons/yandex_map.jpeg';
  static const yandexMapIcon = 'assets/icons/yandex_maps_icon.png';
}

extension AssetsHelper on String {
  SvgPicture svg({
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      color: color,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
