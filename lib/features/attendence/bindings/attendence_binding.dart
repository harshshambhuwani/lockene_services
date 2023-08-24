import 'package:get/get.dart';
import 'package:service/features/attendence/controllers/markattendence_controller.dart';

import '../controllers/attendence_controller.dart';


class AttendenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendenceController>(
      () => AttendenceController(),
    );
    Get.lazyPut<MarkAttendenceController>(
      () => MarkAttendenceController(),
    );
  }
}
