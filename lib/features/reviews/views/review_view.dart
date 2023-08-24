import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../common/circular_loading_widget.dart';
import '../../common/ui.dart';
import '../controllers/review_controller.dart';
import '../widgets/review_item_widget.dart';

class ReviewView extends GetView<ReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshReview(showMessage: true);
        },
        child: CustomScrollView(
          primary: true,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Get.theme.scaffoldBackgroundColor,
              expandedHeight: 180,
              elevation: 0.5,
              primary: true,
              // pinned: true,
              floating: true,
              iconTheme: IconThemeData(color: Get.theme.hintColor),
              title: Text(
                "Review Details".tr,
                style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => {Get.back()},
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 75),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        Text("5",
                            style: Get.textTheme.headline1!.merge(TextStyle(color: Get.theme.hintColor, fontSize: 36, fontWeight: FontWeight.w600))),
                      ],
                    ),
                  )),
            ),
            SliverToBoxAdapter(
                child:  ReviewItemWidget( /*review:controller.review.value*/)
              // }),
            ),
          ],
        ),
      ),
    );
  }
}
