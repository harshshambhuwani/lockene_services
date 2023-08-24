import 'package:get/get.dart';

import '../../common/ui.dart';



class ReviewsController extends GetxController {

  final totalReviews = 0.obs;
  final rate = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await refreshReviews();
    super.onReady();
  }

  Future refreshReviews({bool showMessage = false}) async {
    await getReviews();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Reviews refreshed successfully".tr));
    }
  }

  Future getReviews() async {
    try {

    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}
