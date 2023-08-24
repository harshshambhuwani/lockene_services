import 'package:get/get.dart';

import '../controller/addclient_controller.dart';
import '../controller/allclient_controller.dart';
import '../controller/mycontact_controller.dart';



class AddClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddClientController>(
      () => AddClientController(),
    );
    Get.lazyPut<AllClientsController>(
      () => AllClientsController(),
    );
    Get.lazyPut<MyContactController>(
      () => MyContactController(),
    );

  }
}
