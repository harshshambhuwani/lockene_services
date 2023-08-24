import 'package:get/get.dart';

import '../controller/addquote_controller.dart';
import '../controller/editquote_controller.dart';



class AddQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddQuoteController>(
      () => AddQuoteController(),
    );
    Get.lazyPut<EditQuoteController>(
      () => EditQuoteController(),
    );

  }
}
