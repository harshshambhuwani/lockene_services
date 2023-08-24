import 'package:get/get.dart';
import 'package:service/features/attendence/controllers/markattendence_controller.dart';

import '../controllers/zoom_controller.dart';


class ZoomViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZoomViewController>(
      () => ZoomViewController(),
    );
  }
}
