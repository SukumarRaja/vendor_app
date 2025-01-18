import 'package:get/get.dart';

class FoodController extends GetxController {
  static FoodController get to => Get.put(FoodController());

  final _currentPage = 0.obs;

  get currentPage => _currentPage.value;

  set currentPage(value) {
    _currentPage.value = value;
  }
}
