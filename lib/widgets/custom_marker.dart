import 'package:dorado_map/models/restaurant_model.dart';
import 'package:flutter/material.dart';

import '../constants/restaurant_type.dart';
import '../ui_utils/assets.dart';

class CustomMarker extends StatelessWidget {
  final RestaurantModel restaurant;

  const CustomMarker({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (restaurant.type == RestaurantType.RESTAURANT)
            Assets.restaurant.svg()
          else if (restaurant.type == RestaurantType.COFFEHOUSE)
            Assets.caffeIcon.svg()
          else
            Assets.cupMarker.svg(),
          const SizedBox(height: 5),
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.broomIcon,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                restaurant.cleaning.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                Assets.saxophoneIcon,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                restaurant.music.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                Assets.starIcon,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                restaurant.rating.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
