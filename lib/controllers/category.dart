import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.put(CategoryController());

  final _category = "".obs;

  get category => _category.value;

  set category(value) {
    _category.value = value;
  }

  final _title = "".obs;

  get title => _title.value;

  set title(value) {
    _title.value = value;
  }
}
