import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/features/profile/widgets/phone_field_widget.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/notif_controller.dart';
import '../widgets/notification_item_widget.dart';



class MyNotificationView extends GetView<MyNotificationController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications".tr,
          style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => {Get.back()},
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Get.find<LaravelApiClient>().forceRefresh();
          // await controller.refreshNotifications(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: ListView(
          primary: true,
          children: <Widget>[
            // Text("Incoming Notifications".tr, style: Get.textTheme.headline5).paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
            // Text("Swipe item left to delete it.".tr, style: Get.textTheme.caption).paddingSymmetric(horizontal: 22, vertical: 5),

            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: Ui.getBoxDecoration(color:/* this.notification!.read! ? Get.theme.primaryColor :*/ Get.theme.focusColor.withOpacity(0.15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                              Get.theme.focusColor.withOpacity(1),
                              Get.theme.focusColor.withOpacity(0.2),
                            ])),
                        child:
                            Icon(
                              Icons.chat,
                              color: Get.theme.scaffoldBackgroundColor,
                              size: 38,
                            ),
                      ),
                      Positioned(
                        right: -15,
                        bottom: -30,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -20,
                        top: -55,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "You have notification regarding new Installation",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: /*notification!.read! ? FontWeight.w300 :*/ FontWeight.w600)),
                        ),
                        Text("24 March 2023 | 6:55",
                          // DateFormat('d, MMMM y | HH:mm', Get.locale.toString()).format(/*this.notification!.createdAt!*/12/22/22),
                          style: Get.textTheme.caption,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: Ui.getBoxDecoration(color:/* this.notification!.read! ? Get.theme.primaryColor :*/ Get.theme.focusColor.withOpacity(0.15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                              Get.theme.focusColor.withOpacity(1),
                              Get.theme.focusColor.withOpacity(0.2),
                            ])),
                        child:
                            Icon(
                              Icons.chat,
                              color: Get.theme.scaffoldBackgroundColor,
                              size: 38,
                            ),
                      ),
                      Positioned(
                        right: -15,
                        bottom: -30,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -20,
                        top: -55,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "You have notification regarding new Servicing",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: /*notification!.read! ? FontWeight.w300 :*/ FontWeight.w600)),
                        ),
                        Text("22 March 2023 | 6:55",
                          // DateFormat('d, MMMM y | HH:mm', Get.locale.toString()).format(/*this.notification!.createdAt!*/12/22/22),
                          style: Get.textTheme.caption,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            // notificationsList(),
          ],
        ),
      ),
    );
  }

  Widget notificationsList() {
    // return Obx(() {
    //   if (!controller.notifications.isNotEmpty) {
    //     return CircularLoadingWidget(
    //       height: 300,
    //       onCompleteText: "Notification List is Empty".tr,
    //     );
    //   } else {
    //     var _notifications = controller.notifications;
        return ListView.separated(
            itemCount: /*_notifications.length*/5,
            separatorBuilder: (context, index) {
              return SizedBox(height: 7);
            },
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              // var _notification = controller.notifications.elementAt(index);
              // if (_notification.data!['message_id'] != null) {
              //   return MessageNotificationItemWidget(notification: _notification);
              // } else if (_notification.data!['booking_id'] != null) {
              //   return BookingNotificationItemWidget(notification: _notification);
              // } else {
                return NotificationItemWidget(
                  notification: /*_notification*/2,
                  onDismissed: (notification) {
                    // controller.removeNotification(notification);
                  },
                  onTap: (notification) async {
                    // await controller.markAsReadNotification(notification);
                  },
                );
              // }
            });
      }
  //   });
  // }

  }