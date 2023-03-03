import 'dart:typed_data';

import 'package:dorado_map/extensions/widget_extension.dart';
import 'package:dorado_map/pages/yandex_map_page/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../constants/restaurants.dart';
import '../../ui_utils/assets.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/map_button.dart';

class YandexMapPage extends StatefulWidget {
  final List<Uint8List> markers;

  const YandexMapPage({
    Key? key,
    required this.markers,
  }) : super(key: key);

  @override
  State<YandexMapPage> createState() => _YandexMapPageState();
}

class _YandexMapPageState extends State<YandexMapPage> {
  late final YandexMapController _controller;
  final FocusNode _focusNode = FocusNode();
  final List<PlacemarkMapObject> markers = [];
  double? lat;
  double? long;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < restaurants.length; ++i) {
      markers.add(
        PlacemarkMapObject(
          opacity: 1,
          mapId: MapObjectId(restaurants[i].id),
          point: Point(
            latitude: restaurants[i].lat,
            longitude: restaurants[i].long,
          ),
          onTap: _navigateToPoint,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromBytes(widget.markers[i]),
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: _focusNode.unfocus,
        child: Stack(
          children: [
            YandexMap(
              onMapCreated: (controller) async {
                _controller = controller;
                await _getCurrentPosition(context);
                _initialPosition();
              },
              mapObjects: markers,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SearchTextField(focusNode: _focusNode),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MapButton(
                      onTap: () {
                        _controller.moveCamera(
                          CameraUpdate.zoomIn(),
                          animation: const MapAnimation(
                            duration: 1,
                            type: MapAnimationType.linear,
                          ),
                        );
                      },
                      child: Assets.zoomIcon.svg().centerIcon(),
                    ),
                    const SizedBox(height: 8),
                    MapButton(
                      onTap: () {
                        _controller.moveCamera(
                          CameraUpdate.zoomOut(),
                          animation: const MapAnimation(
                            duration: 1,
                            type: MapAnimationType.linear,
                          ),
                        );
                      },
                      child: Assets.zoomOutIcon.svg().centerIcon(),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MapButton(
                          onTap: _navigateToCurrentLocation,
                          child: Assets.currentLocation.svg().centerIcon(),
                        ),
                        const SizedBox(height: 24),
                        MapButton(
                          onTap: () {},
                          child: Assets.qrIcon.svg().centerIcon(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Footer(),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initialPosition() {
    if (lat != null && long != null) {
      markers.add(
        PlacemarkMapObject(
          opacity: 1,
          mapId: const MapObjectId('current location'),
          point: Point(
            latitude: lat!,
            longitude: long!,
          ),
          onTap: _navigateToPoint,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              scale: 1,
              isVisible: true,
              isFlat: true,
              image: BitmapDescriptor.fromBytes(
                widget.markers[widget.markers.length - 1],
              ),
            ),
          ),
        ),
      );
      _controller.moveCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: Point(
              latitude: 37.786834,
              longitude: -122.406417,
            ),
            zoom: 15,
          ),
        ),
      );

      setState(() {});
    }
  }

  void _navigateToCurrentLocation() {
    if (lat != null && long != null) {
      _controller.moveCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: Point(
              latitude: 37.786834,
              longitude: -122.406417,
            ),
            zoom: 15,
          ),
        ),
        animation: const MapAnimation(
          duration: 1,
          type: MapAnimationType.linear,
        ),
      );
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition(BuildContext context) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      lat = position.latitude;
      long = position.longitude;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void _navigateToPoint(_, point) {
    _controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: point.latitude,
            longitude: point.longitude,
          ),
          zoom: 18,
        ),
      ),
      animation: const MapAnimation(
        duration: 1,
        type: MapAnimationType.linear,
      ),
    );
  }
}
