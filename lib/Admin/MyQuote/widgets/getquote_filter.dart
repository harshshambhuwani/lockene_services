import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GetFilter extends StatefulWidget {

   GetFilter(
      {Key? key}) : super(key: key);

  @override
  State<GetFilter> createState() => _GetFilterState();
}

class _GetFilterState extends State<GetFilter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      height: 280,
      child: Container(
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.focusColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Text('Sort by ',
                    style: Get.textTheme.headline6!.merge(
                      TextStyle(color: Colors.orange, height: 1.2,fontWeight: FontWeight.w500),
                    ),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 1");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.done_outline,color: Colors.black,),
                title: Text('Approved Quote',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 2");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.av_timer_outlined,color: Colors.black,),
                title: Text('Awaited Quote',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 3");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.insert_drive_file,color: Colors.black,),
                title: Text('Drafted Quote',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        //   boxShadow: [
        //     BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
        //   ],
        // ),

      ),
    );

  }
}


class JobFilter extends StatefulWidget {
  const JobFilter({Key? key}) : super(key: key);

  @override
  State<JobFilter> createState() => _JobFilterState();
}

class _JobFilterState extends State<JobFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      height: 340,
      child: Container(
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.focusColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Text('Sort by ',
                    style: Get.textTheme.headline6!.merge(
                      TextStyle(color: Colors.orange, height: 1.2,fontWeight: FontWeight.w500),
                    ),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 1");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.directions_walk,color: Colors.black,),
                title: Text('On The Way',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 2");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.refresh,color: Colors.black,),
                title: Text('In Process',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 3");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.done_outline,color: Colors.black,),
                title: Text('Work Complete',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 4");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.do_not_disturb_alt,color: Colors.black,),
                title: Text('Not Served',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        //   boxShadow: [
        //     BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
        //   ],
        // ),

      ),
    );

  }
}

class InvoiceFilter extends StatefulWidget {
  const InvoiceFilter({Key? key}) : super(key: key);

  @override
  State<InvoiceFilter> createState() => _InvoiceFilterState();
}

class _InvoiceFilterState extends State<InvoiceFilter> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFF737373),
      height: size.height *0.4,
      child: Container(
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.focusColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Text('Sort by ',
                    style: Get.textTheme.headline6!.merge(
                      TextStyle(color: Colors.orange, height: 1.2,fontWeight: FontWeight.w500),
                    ),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 1");
                Navigator.pop(context);
              },
              child: ListTile(
                dense: true,
                leading: Icon(Icons.insert_drive_file,color: Colors.black,),
                title: Text('Draft',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 2");
                Navigator.pop(context);
              },
              child: ListTile(
                dense: true,
                leading: Icon(Icons.warning_amber_outlined,color: Colors.black,),
                title: Text('Past Due',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 3");
                Navigator.pop(context);
              },
              child: ListTile(
                dense: true,

                leading: Icon(Icons.access_time,color: Colors.black,),
                title: Text('Awaiting Payment',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 4");
                Navigator.pop(context);
              },
              child: ListTile(
                dense: true,
                leading: Icon(Icons.done_outline,color: Colors.black,),
                title: Text('Paid',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 5");
                Navigator.pop(context);
              },
              child: ListTile(
                dense: true,
                leading: Icon(Icons.do_not_disturb_alt,color: Colors.black,),
                title: Text('Bad Debt',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey.shade600, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

      ),
    );

  }
}
