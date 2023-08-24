import 'package:get/get.dart';

import '../controller/search_controller.dart';


class AllMembBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );

  }
}
