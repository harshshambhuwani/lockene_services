import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles/styles.dart';
import '../../common/ui.dart';
import '../../../routes/app_routes.dart';


class ReviewItemWidget extends StatelessWidget {
  // final Review? review;

  ReviewItemWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.REVIEW, arguments: 1/*this.review*/);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: Ui.getBoxDecoration(color: page),
        child: Wrap(
          runSpacing: 15,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Text(
                    /*review!.eService!.name!*/'Wedding Photos',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  ),
                ),
                // SizedBox(
                //   height: 26,
                //   child: Chip(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                //     label: Text(/*review!.eService!.totalReviews.toString()*/'Hi', style: Get.textTheme.bodyText1!.merge(TextStyle(height: 0.6))),
                //     backgroundColor: Get.theme.focusColor.withOpacity(0.2),
                //     shape: StadiumBorder(),
                //   ),
                // ),

                SizedBox(
                  height: 32,
                  child: Chip(
                    padding: EdgeInsets.all(0),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(/*review!.rate.toString()*/' 5.0 ', style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.white))),
                        Icon(
                          Icons.star_border,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                    backgroundColor: Colors.orange,
                    shape: StadiumBorder(),
                  ),
                ),

              ],
            ),
            Divider(height: 0, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                    imageUrl: "https://cdn-icons-png.flaticon.com/512/4140/4140048.png",
                    placeholder: (context, url) => Image.asset(
                      'assets/img/loading.gif',
                      fit: BoxFit.cover,
                      height: 65,
                      width: 65,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error_outline),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        /*review!.user!.name!*/'Rajat M',
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        maxLines: 2,
                        style: Get.textTheme.bodyText2!.merge(TextStyle(color: Get.theme.hintColor)),
                      ),
                      Text(
                        /*review!.user!.bio!*/"rajat@gmail.com",
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.caption,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 32,
                //   child: Chip(
                //     padding: EdgeInsets.all(0),
                //     label: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Text(/*review!.rate.toString()*/' 5.0', style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.white))),
                //         Icon(
                //           Icons.star_border,
                //           color: Colors.white,
                //           size: 16,
                //         ),
                //       ],
                //     ),
                //     backgroundColor: Colors.orange,
                //     shape: StadiumBorder(),
                //   ),
                // ),
              ],
            ),
            Ui.removeHtml(/*review!.review!*/' I am so glad that I stumbled across this Photography. I can’t say enough about how professional is and the quality of work that he provides. I was so pleased with my session and final photographs, that I will continue to use him in the future.', style: Get.textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
