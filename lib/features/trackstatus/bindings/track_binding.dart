import 'package:get/get.dart';
import 'package:service/features/attendence/controllers/markattendence_controller.dart';

import '../controllers/track_controller.dart';


class TrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackController>(
      () => TrackController(),
    );
  }
}
