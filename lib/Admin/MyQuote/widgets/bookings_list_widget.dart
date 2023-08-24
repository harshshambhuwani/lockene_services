import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/Admin/MyQuote/controller/allquote_controller.dart';
import 'package:service/Admin/MyQuote/widgets/bookings_list_item_widget.dart';



class BookingsListWidget extends GetView<AllQuoteController> {
  final String title;

  BookingsListWidget(this.title);


  @override
  Widget build(BuildContext context) {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          primary: false,
          shrinkWrap: true,
          itemCount: /*controller.bookings.length*/ 10 + 1,
          itemBuilder: ((_, index) {
            if (index == /*controller.bookings.length*/ 10) {
              return Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Center(
                    child: new Opacity(
                      opacity: controller.isLoading.value ? 1 : 0,
                      child: new CircularProgressIndicator(),
                    ),
                  ),
                );
              });
            } else {
              // var _booking = controller.bookings.elementAt(index);
              return BookingsListItemWidget(title);
            }
          }),
        );
      // }
    // }
    // );
  }
}
