import '../constants/restaurant_type.dart';

class RestaurantModel {
  String id;
  String name;
  double music;
  double cleaning;
  double rating;
  double lat;
  double long;
  RestaurantType type;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.music,
    required this.cleaning,
    required this.rating,
    required this.long,
    required this.lat,
    required this.type,
  });
}
