import 'package:flutter/material.dart';
import 'package:vendor_app/models/restaurants.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    print("jjhkh ${widget.restaurant!.title}");
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
