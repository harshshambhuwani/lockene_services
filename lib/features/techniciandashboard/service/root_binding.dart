import 'package:get/get.dart';

import '../../Work Details/controllers/workdetail_controller.dart';
import '../../account/controllers/account_controller.dart';
import '../../bookings/controllers/booking_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../reviews/controllers/review_controller.dart';
import '../../reviews/controllers/reviews_controller.dart';
import '../controllers/root_controller.dart';



class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
    Get.lazyPut<ReviewsController>(
      () => ReviewsController(),
    );
    Get.lazyPut<ReviewController>(
      () => ReviewController(),
    );
    Get.lazyPut<WorkDetailController>(
      () => WorkDetailController(),
      // fenix: true,
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    // Get.lazyPut<SearchController>(
    //   () => SearchController(),
    // );
  }
}
