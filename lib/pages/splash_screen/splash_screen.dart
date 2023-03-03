import 'dart:typed_data';

import 'package:dorado_map/pages/yandex_map_page/yandex_map_page.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../constants/restaurants.dart';
import '../../models/restaurant_model.dart';
import '../../ui_utils/assets.dart';
import '../../widgets/custom_marker.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final ScreenshotController _screenshotController = ScreenshotController();

  List<Uint8List> byteImages = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => buildMarkers(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.yandexMap,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> buildMarkers(BuildContext context) async {
    await _getRestaurants();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => YandexMapPage(
          markers: byteImages,
        ),
      ),
      ModalRoute.withName('/yandex_map'),
    );
  }

  Future<void> _getRestaurants() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await Future.wait(
      restaurants.map((element) => _drawMarkers(element)).toList(),
    );

    final byteImage = await _screenshotController.captureFromWidget(
      Image.asset(
        Assets.yandexMap,
        width: 24,
        height: 24,
      ),
    );

    byteImages.add(byteImage);
  }

  Future<void> _drawMarkers(RestaurantModel restaurantModel) async {
    final byteImage = await _screenshotController.captureFromWidget(
      CustomMarker(restaurant: restaurantModel),
    );
    byteImages.add(byteImage);
  }
}
