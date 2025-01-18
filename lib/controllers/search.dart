import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/api_error.dart';
import '../models/foods.dart';

class SearchFoodController extends GetxController {
  static SearchFoodController get to => Get.put(SearchFoodController());

  final _isLoading = false.obs;

  get isLoading => _isLoading.value;

  set isLoading(value) {
    _isLoading.value = value;
  }

  final _searchResults = <FoodsModel>[].obs;

  get searchResults => _searchResults.value;

  set searchResults(value) {
    _searchResults.value = value;
  }

  searchFoods({key}) async {
    isLoading = true;
    var url = Uri.parse("$appBaseUrl/api/food/search/$key");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        isLoading = false;
        searchResults = foodsModelFromJson(res.body);
      } else {
        isLoading = false;
        var error = apiErrorFromJson(res.body);
      }
    } catch (e) {
      isLoading = false;
      debugPrint("Error on search foods $e");
    }
  }
}
