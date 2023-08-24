import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/home_controller.dart';

class BookingOptionsPopupMenuWidget extends GetView<HomeController> {
  // const BookingOptionsPopupMenuWidget({
  //   Key? key,
  //   // required Booking booking,
  // });
      // : _booking = booking,
      //   super(key: key);

  // final Booking _booking;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onSelected: (item) async {
        switch (item) {
          case "Edit":
            {
              // await controller.acceptBookingService(_booking);
              print("edit");
            }
            break;
          case "Delete":
            {
              print("delete");

              // await controller.declineBookingService(_booking);
            }
            break;
        }
      },
      itemBuilder: (context) {
        var list = <PopupMenuEntry<Object>>[];
        // list.add(
        //   PopupMenuItem(
        //     child: Wrap(
        //       crossAxisAlignment: WrapCrossAlignment.center,
        //       spacing: 10,
        //       children: [
        //         Icon(Icons.assignment_outlined, color: Get.theme.hintColor),
        //         Text(
        //           "ID #".tr,
        //           style: TextStyle(color: Get.theme.hintColor),
        //         ),
        //       ],
        //     ),
        //     value: "view",
        //   ),
        // );
        list.add(
          PopupMenuItem(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                Text(
                  " Delete".tr,
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
            value: "delete",
          ),

        );
        // if (_booking.status!.order == Get.find<GlobalService>().global.value.received) {
          list.add(
            PopupMenuItem(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  Icon(Icons.edit_outlined, color: Get.theme.hintColor),
                  Text(
                    " Edit".tr,
                    style: TextStyle(color: Get.theme.hintColor),
                  ),
                ],
              ),
              value: "edit",
            ),
          );

        return list;
      },
      child: Icon(
        Icons.more_vert,
        color: Get.theme.hintColor,
      ),
    );
  }
}
