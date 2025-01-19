import 'package:flutter/material.dart';
import 'package:vendor_app/models/restaurants.dart';

class FetchRestaurant {
  final RestaurantsModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? reFetch;

  FetchRestaurant(
      {required this.data,
      required this.isLoading,
      required this.error,
      required this.reFetch});
}
