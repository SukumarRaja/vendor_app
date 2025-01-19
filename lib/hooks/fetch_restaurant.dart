import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/api_error.dart';
import '../models/hook_models/restaurant_hook.dart';
import '../models/restaurants.dart';

FetchRestaurant useFetchRestaurant({code}) {
  final restaurants = useState<RestaurantsModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse("$appBaseUrl/api/restaurant/byId/$code");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var restaurant = jsonDecode(response.body);
        restaurants.value = RestaurantsModel.fromJson(restaurant);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  reFetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchRestaurant(
      data: restaurants.value,
      isLoading: isLoading.value,
      error: error.value,
      reFetch: reFetch);
}
