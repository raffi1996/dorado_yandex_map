import 'package:uuid/uuid.dart';

import '../models/restaurant_model.dart';
import 'restaurant_type.dart';

final restaurants = [
  RestaurantModel(
    id: const Uuid().v4(),
    name: 'Кайф провенансе',
    music: 4.1,
    cleaning: 2.2,
    rating: 1.6,
    type: RestaurantType.CAFE,
    lat: 37.789834,
    long: -122.406417,
  ),
  RestaurantModel(
    id: const Uuid().v4(),
    name: 'Кайф провенансе',
    music: 2.3,
    cleaning: 4.5,
    rating: 5,
    type: RestaurantType.COFFEHOUSE,
    lat: 37.787834,
    long: -122.407417,
  ),
  RestaurantModel(
    id: const Uuid().v4(),
    name: 'Кайф провенансе',
    music: 1,
    cleaning: 5,
    rating: 3,
    type: RestaurantType.RESTAURANT,
    lat: 37.781834,
    long: -122.401417,
  ),
  RestaurantModel(
    id: const Uuid().v4(),
    name: 'Кайф провенансе',
    music: 1,
    cleaning: 5,
    rating: 2,
    type: RestaurantType.CAFE,
    lat: 37.782834,
    long: -122.402417,
  ),
  RestaurantModel(
    id: const Uuid().v4(),
    name: 'Кайф провенансе',
    music: 5,
    cleaning: 5,
    rating: 5,
    type: RestaurantType.RESTAURANT,
    lat: 37.783834,
    long: -122.403417,
  ),
  RestaurantModel(
    id: const Uuid().v4(),
    name: 'Кайф провенансе',
    music: 2.4,
    cleaning: 2.8,
    rating: 4.8,
    type: RestaurantType.COFFEHOUSE,
    lat: 37.784834,
    long: -122.404417,
  ),
];