import 'package:get/get.dart';

class TabIndexController extends GetxController {
  static TabIndexController get to => Get.put(TabIndexController());
  final _tabIndex = 0.obs;

  get tabIndex => _tabIndex.value;

  set tabIndex(value) {
    _tabIndex.value = value;
  }
}
