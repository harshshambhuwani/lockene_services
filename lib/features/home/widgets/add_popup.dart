import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';


class Add_Popup extends StatefulWidget {
  const Add_Popup({Key? key}) : super(key: key);

  @override
  State<Add_Popup> createState() => _Add_PopupState();
}

class _Add_PopupState extends State<Add_Popup> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
        scrollable: true,

        contentPadding: EdgeInsets.zero,
        title: Text('Create New'),
    content: Container(
    width: size.width * 0.9,
    // height: size.height * 0.4,
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       GestureDetector(
        onTap: (){
          Get.offAndToNamed(Routes.ADD_QUOTE);
          // Navigator.pop(context);
        },
         child: Container(
           width: double.infinity,
           color: Colors.white,
           child: Row(
             children: [
               Icon(Icons.sticky_note_2_outlined, color: Colors.orange),
               Text('Quote',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(height: 1, color: Colors.grey.shade800,fontWeight: FontWeight.w500),
                  ),).marginOnly(left: 10.0),
             ],
           ),
         ),
       ),
          Container(
            height: size.height*0.0005,
            color: Colors.grey,
          ).marginSymmetric(vertical: 10.0),
        GestureDetector(
           onTap: (){
             Get.offAndToNamed(Routes.ADD_JOB);
           },
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.work_outline_outlined, color: Colors.orange),
                Text('Schedule a Job',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(height: 1, color: Colors.grey.shade800,fontWeight: FontWeight.w500),
                  ),).paddingOnly(left: 10.0),
              ],
            ),
          ),
        ),
        Container(
          height: size.height*0.0005,
          color: Colors.grey,
        ).marginSymmetric(vertical: 10.0),

        GestureDetector(
          onTap: (){
            Get.offAndToNamed(Routes.ADD_INVOICE);
            },
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.monetization_on_outlined, color: Colors.orange),
                Text('Add Invoice',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(height: 1, color: Colors.grey.shade800,fontWeight: FontWeight.w500),
                  ),).paddingOnly(left: 10.0),
              ],
            ),
          ),
        ),

      ]),
    ),)
    );
  }
}
