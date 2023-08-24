import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../common/ui.dart';
import '../controllers/zoom_controller.dart';


class ZoomView extends GetView<ZoomViewController> {
  // final bool hideAppBar;

  // MarkAttendence({this.hideAppBar = false}) {
  //   // controller.profileForm = new GlobalKey<FormState>();
  // }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
                title: Text(
                  "Document View".tr,
                  style: context.textTheme.subtitle1,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                  onPressed: () => Get.back(),
                ),
                // actions: [
                //    GestureDetector(
                //        onTap: (){
                //          Get.back();
                //        },
                //        child: Text('Skip',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),textAlign: TextAlign.justify,).marginSymmetric(horizontal: 20.0,vertical: 18.0))
                // ],
                elevation: 0,
              ),
        body: ListView(
          primary: true,
          children: [
            AttendenceDetails(),
          ],
        ));
  }
}

class AttendenceDetails extends StatefulWidget {
  const AttendenceDetails({Key? key}) : super(key: key);

  @override
  State<AttendenceDetails> createState() => _AttendenceDetailsState();
}

class _AttendenceDetailsState extends State<AttendenceDetails> {
  bool inTime = false;
  bool outTime= false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Column(
      children: [
        Container(
          height: size.height * 0.65,
          child:
          CachedNetworkImage(
            fit: BoxFit.fill,
            width: double.infinity,
            height: 160,
            imageUrl:'https://www.allaboutcards.de/mediathek/garantiekarte-hinten.png/image_preview',
            placeholder: (context, url) => Image.asset(
              'assets/img/loading.gif',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error_outline),
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 0.0),
              )
            ],
          ),
        ).marginSymmetric(horizontal: size.width * 0.08,vertical: size.width * 0.08),

      ],
    );
  }
}

